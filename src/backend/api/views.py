from api.models import (
    Announcement,
    ApplicationForms,
    Complaints,
    DvUser,
    PaymentReminders,
    Role,
    UserAddress,
    UserDetails,
    UserPaymentsReminders,
    UserRoles,
    WardRepresentative,
)
from api.serializers import (
    AnnouncementSerializer,
    ApplicationFormsSerializer,
    ComplaintsSerializer,
    DvUserSerializer,
    PaymentRemindersSerializer,
    RoleSerializer,
    UserAddressSerializer,
    UserDetailsSerializer,
    UserPaymentsRemindersSerializer,
    UserRolesSerializer,
    WardRepresentativeSerializer,
)
from api.permissions import ReadWriteProtected
from api.authentication import CustomTokenAuthentication

from rest_framework.exceptions import (
    PermissionDenied,
    ValidationError,
    NotFound,
)
from rest_framework.views import APIView

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import (
    api_view,
    authentication_classes,
    permission_classes,
)

from rest_framework import generics
import bcrypt
import random
import string
import json

from django.views.decorators.csrf import csrf_exempt
import django.db

import base64

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def register_user_scan(request):
    data = request.data.copy()
    print(data)
    return Response("Success", status=status.HTTP_201_CREATED)

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def register_user(request):
    data = request.data.copy()
    print(data)
    return Response("Success", status=status.HTTP_201_CREATED)

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def login_user(request):
    data = request.data.copy()
    print(data)
    return Response("Success", status=status.HTTP_201_CREATED)
