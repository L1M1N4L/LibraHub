# Generated by Django 4.2.6 on 2024-11-26 22:06

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Author',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('email', models.EmailField(blank=True, max_length=254, null=True, unique=True)),
                ('category', models.CharField(choices=[('fiction', 'Fiction'), ('non-fiction', 'Non Fiction'), ('academic', 'Academic')], max_length=20)),
                ('biography', models.TextField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('isbn', models.CharField(max_length=13, unique=True, validators=[django.core.validators.RegexValidator('^\\d{13}$', 'ISBN must be a 13-digit number.')])),
                ('publication_year', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('authors', models.ManyToManyField(related_name='books', to='website.author')),
            ],
        ),
        migrations.CreateModel(
            name='BookCopy',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('copy_number', models.CharField(max_length=20)),
                ('acquisition_date', models.DateField()),
                ('condition', models.CharField(choices=[('new', 'New'), ('good', 'Good'), ('fair', 'Fair'), ('poor', 'Poor')], default='new', max_length=10)),
                ('book', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='copies', to='website.book')),
            ],
        ),
        migrations.CreateModel(
            name='FineReason',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reason', models.CharField(max_length=200, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Genre',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True)),
                ('description', models.TextField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Publisher',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('address', models.CharField(blank=True, max_length=200, null=True)),
                ('contact_email', models.EmailField(blank=True, max_length=254, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Reservation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reservation_date', models.DateField()),
                ('expiry_date', models.DateField()),
                ('status', models.CharField(choices=[('active', 'Active'), ('cancelled', 'Cancelled'), ('fulfilled', 'Fulfilled')], default='active', max_length=20)),
                ('book', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reservations', to='website.book')),
                ('member', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reservations', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Loan',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('loan_date', models.DateField()),
                ('expected_return_date', models.DateField()),
                ('actual_return_date', models.DateField(blank=True, null=True)),
                ('status', models.CharField(choices=[('active', 'Active'), ('returned', 'Returned'), ('overdue', 'Overdue')], default='active', max_length=20)),
                ('book_copy', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='loans', to='website.bookcopy')),
                ('member', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='loans', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Fine',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.DecimalField(decimal_places=2, max_digits=6)),
                ('imposed_date', models.DateField()),
                ('paid_date', models.DateField(blank=True, null=True)),
                ('fine_reason', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='website.finereason')),
                ('loan', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='fine', to='website.loan')),
            ],
        ),
        migrations.AddField(
            model_name='book',
            name='genre',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='website.genre'),
        ),
        migrations.AddField(
            model_name='book',
            name='publisher',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='website.publisher'),
        ),
        migrations.AddConstraint(
            model_name='bookcopy',
            constraint=models.UniqueConstraint(fields=('book', 'copy_number'), name='unique_book_copy'),
        ),
    ]