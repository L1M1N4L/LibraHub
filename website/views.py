from venv import logger
from django.shortcuts import redirect, render
from django.contrib.auth import *
from django.contrib import messages
from .models import Book
# Create your views here.
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
    


def register_user(request):
    return render(request, 'register.html', {})

def logout_user(request):
    logout(request)  # Logs out the user
    return redirect('home')  # Redirects to the home page

