from datetime import date
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

class Member(models.Model):
    username = models.CharField(max_length=150, primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15)
    membership_date = models.DateField(default=date.today)  # Use date.today as default
    email = models.EmailField(unique=True)
    
    def __str__(self):
        return self.user.username