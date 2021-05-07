# Generated by Django 3.1.6 on 2021-03-05 19:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('announcement_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('description', models.CharField(blank=True, max_length=1000, null=True)),
                ('validtill', models.DateField(blank=True, null=True)),
                ('format', models.CharField(blank=True, max_length=100, null=True)),
                ('link', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'announcement',
            },
        ),
        migrations.CreateModel(
            name='ApplicationForms',
            fields=[
                ('form_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=200, null=True)),
                ('description', models.CharField(blank=True, max_length=1500, null=True)),
                ('attachmentlink', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'application_forms',
            },
        ),
        migrations.CreateModel(
            name='Complaints',
            fields=[
                ('complaint_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=150, null=True)),
                ('description', models.CharField(blank=True, max_length=1000, null=True)),
                ('attachmentlink', models.CharField(blank=True, max_length=1000, null=True)),
                ('status', models.CharField(blank=True, max_length=50, null=True)),
                ('notes', models.CharField(blank=True, max_length=1000, null=True)),
                ('category', models.CharField(blank=True, max_length=200, null=True)),
            ],
            options={
                'db_table': 'complaints',
            },
        ),
        migrations.CreateModel(
            name='DvUser',
            fields=[
                ('dv_user_id', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=150)),
                ('password', models.CharField(max_length=150)),
                ('ispasswordreset', models.BooleanField()),
                ('loginrequired', models.BooleanField(blank=True, null=True)),
                ('scandumpdata', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'dv_user',
            },
        ),
        migrations.CreateModel(
            name='PaymentReminders',
            fields=[
                ('payment_id', models.AutoField(primary_key=True, serialize=False)),
                ('category', models.CharField(blank=True, max_length=200, null=True)),
                ('name', models.CharField(blank=True, max_length=200, null=True)),
                ('description', models.CharField(blank=True, max_length=1500, null=True)),
                ('frequency', models.CharField(blank=True, max_length=100, null=True)),
                ('amount', models.BigIntegerField(blank=True, null=True)),
                ('generated', models.BooleanField(blank=True, null=True)),
                ('year', models.BigIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'payment_reminders',
            },
        ),
        migrations.CreateModel(
            name='Role',
            fields=[
                ('role_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=150, null=True)),
            ],
            options={
                'db_table': 'role',
            },
        ),
        migrations.CreateModel(
            name='UserAddress',
            fields=[
                ('user_address_id', models.AutoField(primary_key=True, serialize=False)),
                ('houseno', models.CharField(blank=True, max_length=200, null=True)),
                ('wardno', models.CharField(blank=True, max_length=200, null=True)),
                ('street', models.CharField(blank=True, max_length=200, null=True)),
                ('pin', models.CharField(blank=True, max_length=200, null=True)),
                ('landmark', models.CharField(blank=True, max_length=300, null=True)),
                ('dv_user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.dvuser')),
            ],
            options={
                'db_table': 'user_address',
            },
        ),
        migrations.CreateModel(
            name='WardRepresentative',
            fields=[
                ('ward_rep_id', models.AutoField(primary_key=True, serialize=False)),
                ('wardno', models.BigIntegerField(blank=True, null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.dvuser')),
            ],
            options={
                'db_table': 'ward_representative',
            },
        ),
        migrations.CreateModel(
            name='UserRoles',
            fields=[
                ('user_role_id', models.AutoField(primary_key=True, serialize=False)),
                ('role', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.role')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.dvuser')),
            ],
            options={
                'db_table': 'user_roles',
            },
        ),
        migrations.CreateModel(
            name='UserPaymentsReminders',
            fields=[
                ('user_payments_id', models.AutoField(primary_key=True, serialize=False)),
                ('status', models.CharField(blank=True, max_length=200, null=True)),
                ('totalamount', models.FloatField(blank=True, null=True)),
                ('paid', models.FloatField(blank=True, null=True)),
                ('balance', models.FloatField(blank=True, null=True)),
                ('duedate', models.DateField(blank=True, null=True)),
                ('notes', models.CharField(blank=True, max_length=1500, null=True)),
                ('payment', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.paymentreminders')),
                ('user_address', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.useraddress')),
            ],
            options={
                'db_table': 'user_payments_reminders',
            },
        ),
        migrations.CreateModel(
            name='UserDetails',
            fields=[
                ('user_details_id', models.AutoField(primary_key=True, serialize=False)),
                ('firstname', models.CharField(max_length=150)),
                ('lastname', models.CharField(blank=True, max_length=150, null=True)),
                ('aadhaarno', models.BigIntegerField(blank=True, null=True)),
                ('mobileno', models.BigIntegerField(blank=True, null=True)),
                ('dob', models.DateField(blank=True, null=True)),
                ('dv_user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.dvuser')),
                ('user_address', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.useraddress')),
            ],
            options={
                'db_table': 'user_details',
                'unique_together': {('aadhaarno', 'mobileno')},
            },
        ),
        migrations.AddField(
            model_name='useraddress',
            name='user_details',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.userdetails'),
        ),
    ]
