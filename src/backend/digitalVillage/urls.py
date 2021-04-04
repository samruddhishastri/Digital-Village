"""digitalVillage URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import include
from api import views
#from rest_framework.authtoken import views 

urlpatterns = [
    path("api/qrregister", views.register_user_scan),
    path("api/register", views.register_user),
    path("api/login", views.login_user),
    path("api/make_complaint", views.make_complaint),
    path("api/view_complaints", views.ViewComplaints.as_view()),
    path("api/detail_complaint/<int:pk>/", views.DetailComplaint.as_view()),
    path("api/update_details", views.update_details),
    #path('api-token-auth/', views.obtain_auth_token, name='api-tokn-auth'), 
    path("api/retrieve_all_users", views.RetrieveAllUsers.as_view()),
    path("api/retrieve_one_user/<int:pk>/", views.RetrieveOneUser.as_view()),
    #path("api/add_admin/", views.add_admin),
    path("api/view_contacts/", views.ViewContacts.as_view()),
    path("api/update_complaint_status",  views.update_complaint_status),
    path("api/add_announcement", views.add_announcement),
    path("api/view_announcements", views.ViewAnnouncements.as_view()),
    path("api/detail_announcement/<int:pk>/", views.DetailAnnouncement.as_view()),
    path("api/add_form", views.add_form),
    path("api/view_forms", views.ViewForms.as_view()),
    path("api/reset_password", views.reset_password),
    path("api/add_dependent",views.add_dependent)
]
