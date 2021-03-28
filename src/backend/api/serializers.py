from rest_framework import serializers
from api.models import (
    Announcement,
    ApplicationForms,
    Complaints,
    Contacts,
    DvUser,
    PaymentReminders,
    Role,
    UserAddress,
    UserDetails,
    UserPaymentsReminders,
    UserRoles,
    WardRepresentative
)


class AnnouncementSerializer(serializers.ModelSerializer):
    
    class Meta:
        fields = "__all__"
        model = Announcement


class ApplicationFormsSerializer(serializers.ModelSerializer):

    class Meta:
        fields = "__all__"
        model = ApplicationForms


class ComplaintsSerializer(serializers.ModelSerializer):

    class Meta:
        fields = "__all__"
        model = Complaints

class ContactsSerializer(serializers.ModelSerializer):

    class Meta:
        fields = "__all__"
        model = Contacts

class DvUserSerializer(serializers.ModelSerializer):
    
    class Meta:
        fields = "__all__"
        #extra_kwargs = {"password": {"write_only": True}}
        model = DvUser


class PaymentRemindersSerializer(serializers.ModelSerializer):
    
    class Meta:
        fields = "__all__"
        model = PaymentReminders


class RoleSerializer(serializers.ModelSerializer):
    
    class Meta:
        fields = "__all__"
        model = Role

class UserAddressSerializer(serializers.ModelSerializer):

    class Meta:
        fields = "__all__"
        model = UserAddress


class UserDetailsSerializer(serializers.ModelSerializer):

    class Meta:
        fields = "__all__"
        model = UserDetails


class UserPaymentsRemindersSerializer(serializers.ModelSerializer):
    
    class Meta:
        fields = "__all__"


class UserRolesSerializer(serializers.ModelSerializer):
    
    class Meta:
        fields = "__all__"
        model = UserRoles


class WardRepresentativeSerializer(serializers.ModelSerializer):
   
    class Meta:
        fields = "__all__"
        model = WardRepresentative
