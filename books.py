import os
import django
import requests
from datetime import datetime

# Set up Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'dcrm.settings')
django.setup()

# Import models
from website.models import (
    Author, Genre, Publisher, Book, BookCopy, 
    AuthorCategory
)

class OpenLibraryImporter:
    def __init__(self):
        self.base_url = 'https://openlibrary.org'
        self.works_url = f'{self.base_url}/search.json'
        self.default_genre, _ = Genre.objects.get_or_create(
            name='General', 
            description='Unclassified book genre'
        )
        self.default_publisher, _ = Publisher.objects.get_or_create(
            name='Unknown Publisher', 
            address='Unspecified'
        )

    def get_author_details(self, author_key):
        """Fetch detailed author information"""
        try:
            full_url = f'{self.base_url}{author_key}.json'
            response = requests.get(full_url)
            if response.status_code == 200:
                author_data = response.json()
                return {
                    'name': author_data.get('name', 'Unknown Author'),
                    'biography': author_data.get('bio', {}).get('value', '') if isinstance(author_data.get('bio'), dict) else str(author_data.get('bio', ''))
                }
            return {'name': 'Unknown Author', 'biography': ''}
        except Exception as e:
            print(f"Error fetching author details for {author_key}: {e}")
            return {'name': 'Unknown Author', 'biography': ''}

    def create_or_get_author(self, author_key, name=None):
        """Create or get an author"""
        try:
            # If no name provided, fetch details
            if not name:
                author_details = self.get_author_details(author_key)
                name = author_details['name']

            # Try to find existing author
            author, created = Author.objects.get_or_create(
                name=name,
                defaults={
                    'category': AuthorCategory.FICTION,
                    'biography': author_details.get('biography', '')
                }
            )
            return author
        except Exception as e:
            print(f"Error creating author {name}: {e}")
            return None

    def import_books(self, limit=100):
        """Import books from Open Library"""
        try:
            # Fetch works
            params = {
                'q': '*',  # All works
                'limit': limit,
                'has_fulltext': 'true'  # Books with full text
            }
            response = requests.get(self.works_url, params=params)
            
            if response.status_code != 200:
                print(f"Failed to fetch books: {response.status_code}")
                return

            # Safely get docs, default to empty list
            works = response.json().get('docs', [])
            
            imported_count = 0
            failed_count = 0

            # Ensure works is iterable
            if not isinstance(works, list):
                print("Received invalid works data. Expected a list.")
                return

            for work in works:
                try:
                    # Basic book details
                    title = work.get('title', 'Untitled')
                    
                    # Safely get ISBNs
                    isbns = work.get('isbn', [])
                    if not isinstance(isbns, list):
                        isbns = []

                    # Get ISBN (prefer 13-digit)
                    isbn = next((isbn for isbn in isbns if len(str(isbn)) == 13), 
                                next((isbn for isbn in isbns), 'UNKNOWN_ISBN'))
                    
                    # Skip if book already exists or invalid ISBN
                    if not isbn or Book.objects.filter(isbn=isbn).exists():
                        continue

                    # Authors
                    authors = []
                    author_keys = work.get('author_key', [])
                    if not isinstance(author_keys, list):
                        author_keys = []

                    for author_key in author_keys:
                        author_path = f'/authors/{author_key}'
                        author = self.create_or_get_author(author_path)
                        if author:
                            authors.append(author)

                    # Publication year (protect against non-integer)
                    try:
                        pub_year = int(work.get('first_publish_year')) if work.get('first_publish_year') else None
                    except (ValueError, TypeError):
                        pub_year = None

                    # Create book
                    book = Book.objects.create(
                        title=title,
                        isbn=str(isbn),
                        publication_year=pub_year,
                        genre=self.default_genre,
                        publisher=self.default_publisher
                    )

                    # Add authors
                    book.authors.set(authors)

                    # Create book copy
                    BookCopy.objects.create(
                        book=book,
                        copy_number='001',
                        acquisition_date=datetime.now().date()
                    )

                    imported_count += 1
                    print(f"Imported: {title}")

                except Exception as book_error:
                    print(f"Error importing individual book: {book_error}")
                    failed_count += 1

            print(f"Total books imported: {imported_count}")
            print(f"Total books failed: {failed_count}")

        except Exception as e:
            print(f"Error in book import process: {e}")

def main():
    importer = OpenLibraryImporter()
    importer.import_books(limit=100)

if __name__ == '__main__':
    main()