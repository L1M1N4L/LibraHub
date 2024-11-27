from datetime import date, timezone
from venv import logger
from django.contrib.auth.models import User
from django.http import Http404
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib.auth import *
from django.contrib import messages
from .models import Book, Loan

from website.models import Member

def home(request):
    """Handle login form submission and authentication."""
    books = Book.objects.prefetch_related('authors')
    
    # Check if request is a login attempt
    if request.method == 'POST':
        # Get credentials from form, using get() with default values to prevent KeyError
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        
        # Validate input presence
        if not username or not password:
            messages.error(request, "Both username and password are required")
            return redirect('home')
            
        # Sanitize inputs (remove leading/trailing whitespace)
        username = username.strip()
        
        try:
            # Attempt authentication
            user = authenticate(
                request,
                username=username,
                password=password
            )
            
            if user is not None:
                # User authenticated successfully
                login(request, user)
                return redirect('home')
            else:
                # Invalid credentials
                messages.error(request, "Invalid username or password")
                return redirect('home')
                
        except Exception as e:
            # Log the error securely (don't expose details to user)
            logger.error(f"Login error: {str(e)}")
            messages.error(request, "An error occurred during login")
            return redirect('home')
    
    # GET request - display login form
    return render(request, 'home.html', {'Books': books})
def book_detail(request, book_id):
    book = get_object_or_404(Book, id=book_id)
    authors = book.authors.all()
    genre = book.genre
    publisher = book.publisher

    context = {
        'book': book,
        'authors': authors,
        'genre': genre,
        'publisher': publisher,
    }

    return render(request, 'book_detail.html', context)


def register_user(request):
    if request.method == 'POST':
        # Get form data
        username = request.POST.get('username')
        password = request.POST.get('password')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        
        # Check if username already exists
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists')
            return render(request, 'register.html')
        
        # Check if email already exists
        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email already exists')
            return render(request, 'register.html')
        
        # Create user
        user = User.objects.create_user(
            username=username,
            password=password,
            first_name=first_name,
            last_name=last_name,
            email=email
        )
        
        # Create member
        Member.objects.create(
            user=user,
            phone=phone,
            membership_date=date.today()  # Use date.today()
        )
        
        messages.success(request, 'Registration Successful!')
    
    return render(request, 'register.html')

def logout_user(request):
    logout(request)  # Logs out the user
    return redirect('home')  # Redirects to the home page

