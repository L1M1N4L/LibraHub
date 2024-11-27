import random
import mysql.connector

# Replace with your actual MySQL connection details
conn = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = 'Leewin260905',
    database = 'dcrm'
    )
# Step 2: Create a cursor object to interact with the database
cursor = conn.cursor()

genre_id_range = range(68, 155)

# Update the genre_id for books with IDs between 1 and 100 in the website_book table
for book_id in range(1, 101):  # IDs from 1 to 100 inclusive
    random_genre_id = random.choice(genre_id_range)  # Choose a random genre_id
    try:
        cursor.execute("""
            UPDATE website_book 
            SET genre_id = %s 
            WHERE id = %s
        """, (random_genre_id, book_id))
        conn.commit()  # Commit the changes
        print(f"Updated book ID {book_id} with genre ID {random_genre_id}")
    except mysql.connector.Error as err:
        print(f"Error updating book ID {book_id}: {err}")
        conn.rollback()  # Roll back in case of error

# Close the cursor and connection
cursor.close()
conn.close()

print("Genre update process completed.")