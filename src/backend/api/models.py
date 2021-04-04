from phonenumber_field.modelfields import PhoneNumberField
from datetime import date
import calendar
import bcrypt
import string
import random
import subprocess
import tempfile
import os

from django.db import models
from django.core.files import File
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token
from django.utils.timezone import now
from datetime import datetime


class Announcement(models.Model):
	announcement_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=100, blank=True, null=True)
	description = models.CharField(max_length=1000, blank=True, null=True)
	validtill = models.DateField(blank=True, null=True)
	format = models.CharField(max_length=100, blank=True, null=True)
	link = models.CharField(max_length=1000, blank=True, null=True)
	creation_date = models.DateTimeField(auto_now_add=True, blank=True)

	class Meta:
		db_table = 'announcement'


class ApplicationForms(models.Model):
	form_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=200, blank=True, null=True)
	description = models.CharField(max_length=1500, blank=True, null=True)
	attachmentlink = models.CharField(max_length=1000, blank=True, null=True)
	creation_date = models.DateTimeField(auto_now_add=True, blank=True)

	class Meta:
		db_table = 'application_forms'


class Complaints(models.Model):
	complaint_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=150, blank=True, null=True)
	description = models.CharField(max_length=1000, blank=True, null=True)
	attachmentlink = models.CharField(max_length=1000, blank=True, null=True)
	status = models.CharField(max_length=50, blank=True, null=True)
	notes = models.CharField(max_length=1000, blank=True, null=True)
	category = models.CharField(max_length=200, blank=True, null=True)
	creation_date = models.DateTimeField(auto_now_add=True, blank=True)

	class Meta:
		db_table = 'complaints'



class DvUser(models.Model):
	dv_user_id = models.AutoField(primary_key=True)
	username = models.CharField(max_length=150)
	password = models.CharField(max_length=150, editable=True)
	ispasswordreset = models.BooleanField()
	loginrequired = models.BooleanField(blank=True, null=True)
	scandumpdata = models.CharField(max_length=1000, blank=True, null=True)

	class Meta:
		db_table = 'dv_user'


class PaymentReminders(models.Model):
	payment_id = models.AutoField(primary_key=True)
	category = models.CharField(max_length=200, blank=True, null=True)
	name = models.CharField(max_length=200, blank=True, null=True)
	description = models.CharField(max_length=1500, blank=True, null=True)
	frequency = models.CharField(max_length=100, blank=True, null=True)
	amount = models.BigIntegerField(blank=True, null=True)
	generated = models.BooleanField(blank=True, null=True)
	year = models.BigIntegerField(blank=True, null=True)

	class Meta:
		db_table = 'payment_reminders'


class Role(models.Model):
	role_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=150, blank=True, null=True)

	class Meta:
		db_table = 'role'


class UserAddress(models.Model):
	user_address_id = models.AutoField(primary_key=True)
	dv_user = models.ForeignKey(DvUser, models.CASCADE, blank=True, null=True)
	houseno = models.CharField(max_length=200, blank=True, null=True)
	wardno = models.CharField(max_length=200, blank=True, null=True)
	street = models.CharField(max_length=200, blank=True, null=True)
	pin = models.CharField(max_length=200, blank=True, null=True)
	landmark = models.CharField(max_length=300, blank=True, null=True)

	class Meta:
		db_table = 'user_address'


class UserDetails(models.Model):
	user_details_id = models.AutoField(primary_key=True)
	dv_user = models.ForeignKey(DvUser, models.CASCADE, blank=True, null=True)
	firstname = models.CharField(max_length=150)
	lastname = models.CharField(max_length=150, blank=True, null=True)
	aadhaarno = models.BigIntegerField(blank=True, null=True)
	mobileno = PhoneNumberField(blank=True, null=True)
	dob = models.DateField(blank=True, null=True)
	user_address = models.ForeignKey(UserAddress, models.CASCADE, blank=True, null=True)
	profession = models.CharField(max_length=150, blank=True, null=True)
	
	class Meta:
		db_table = 'user_details'
		unique_together = (('aadhaarno', 'mobileno'),)


class UserPaymentsReminders(models.Model):
	user_payments_id = models.AutoField(primary_key=True)
	payment = models.ForeignKey(PaymentReminders, models.CASCADE, blank=True, null=True)
	user_address = models.ForeignKey(UserAddress, models.CASCADE, blank=True, null=True)
	status = models.CharField(max_length=200, blank=True, null=True)
	totalamount = models.FloatField(blank=True, null=True)
	paid = models.FloatField(blank=True, null=True)
	balance = models.FloatField(blank=True, null=True)
	duedate = models.DateField(blank=True, null=True)
	notes = models.CharField(max_length=1500, blank=True, null=True)

	class Meta:
		db_table = 'user_payments_reminders'


class UserRoles(models.Model):
	user_role_id = models.AutoField(primary_key=True)
	role = models.ForeignKey(Role, models.CASCADE, blank=True, null=True)
	user = models.ForeignKey(DvUser, models.CASCADE, blank=True, null=True)

	class Meta:
		db_table = 'user_roles'


class WardRepresentative(models.Model):
	ward_rep_id = models.AutoField(primary_key=True)
	user = models.ForeignKey(DvUser, models.CASCADE, blank=True, null=True)
	wardno = models.BigIntegerField(blank=True, null=True)

	class Meta:
		db_table = 'ward_representative'

class Contacts(models.Model):
	contact_id = models.AutoField(primary_key=True)
	name = models.CharField(max_length=200, blank=True, null=True)
	mobileno = PhoneNumberField(blank=True, null=True)	
	profession = models.CharField(max_length=200, blank=True, null=True)
	

	class Meta:
		db_table = 'contacts'
	

class Session(models.Model):
	user = models.ForeignKey(DvUser, models.CASCADE)
	key = models.CharField(max_length=64)
