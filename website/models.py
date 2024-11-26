from django.db import models
from django.contrib.auth import get_user_model
from django.core.validators import RegexValidator

class AuthorCategory(models.TextChoices):
    FICTION = 'fiction'
    NON_FICTION = 'non-fiction'
    ACADEMIC = 'academic'

class BookCondition(models.TextChoices):
    NEW = 'new'
    GOOD = 'good'
    FAIR = 'fair'
    POOR = 'poor'


class LoanStatus(models.TextChoices):
    ACTIVE = 'active'
    RETURNED = 'returned'
    OVERDUE = 'overdue'

class ReservationStatus(models.TextChoices):
    ACTIVE = 'active'
    CANCELLED = 'cancelled'
    FULFILLED = 'fulfilled'


class FineReason(models.Model):
    reason = models.CharField(max_length=200, unique=True)

    def __str__(self):
        return self.reason

class Author(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(unique=True, null=True, blank=True)  # Allow null/blank
    category = models.CharField(max_length=20, choices=AuthorCategory.choices)
    biography = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name

class Genre(models.Model):
    name = models.CharField(max_length=50, unique=True)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name

class Publisher(models.Model):
    name = models.CharField(max_length=100, unique=True)
    address = models.CharField(max_length=200, null=True, blank=True)
    contact_email = models.EmailField(null=True, blank=True)

    def __str__(self):
        return self.name


class Book(models.Model):
    title = models.CharField(max_length=200)

    isbn = models.CharField(
        max_length=13,
        unique=True,
        validators=[RegexValidator(r"^\d{13}$", "ISBN must be a 13-digit number.")]
    )  # Add ISBN validator
    publication_year = models.PositiveSmallIntegerField(null=True, blank=True)  # PositiveIntegerField for year
    authors = models.ManyToManyField(Author, related_name='books')
    genre = models.ForeignKey(Genre, on_delete=models.SET_NULL, null=True, blank=True)  # Allow null/blank
    publisher = models.ForeignKey(Publisher, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.title




class BookCopy(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='copies')
    copy_number = models.CharField(max_length=20)
    acquisition_date = models.DateField()
    condition = models.CharField(max_length=10, choices=BookCondition.choices, default=BookCondition.NEW)  # Use enum

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['book', 'copy_number'], name='unique_book_copy')
        ]

    def __str__(self):
        return f"{self.book.title} (Copy {self.copy_number})"



class Loan(models.Model):
    book_copy = models.ForeignKey(BookCopy, on_delete=models.CASCADE, related_name='loans')
    member = models.ForeignKey(get_user_model(), on_delete=models.CASCADE, related_name='loans') # Django's User
    loan_date = models.DateField()
    expected_return_date = models.DateField()
    actual_return_date = models.DateField(null=True, blank=True)
    status = models.CharField(max_length=20, choices=LoanStatus.choices, default=LoanStatus.ACTIVE)

    def __str__(self):
        return f"Loan of {self.book_copy} to {self.member.username}"


class Reservation(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='reservations')
    member = models.ForeignKey(get_user_model(), on_delete=models.CASCADE, related_name='reservations') # Django user
    reservation_date = models.DateField()
    expiry_date = models.DateField()
    status = models.CharField(max_length=20, choices=ReservationStatus.choices, default=ReservationStatus.ACTIVE)

class Fine(models.Model):
    loan = models.OneToOneField(Loan, on_delete=models.CASCADE, related_name='fine')  # One-to-one with Loan
    amount = models.DecimalField(max_digits=6, decimal_places=2)  # Use DecimalField for currency
    imposed_date = models.DateField()
    paid_date = models.DateField(null=True, blank=True)
    fine_reason = models.ForeignKey(FineReason, on_delete=models.SET_NULL, null=True, blank=True)