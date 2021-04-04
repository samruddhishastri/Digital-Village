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
    WardRepresentative,
    Session,
)
from api.serializers import (
    AnnouncementSerializer,
    ApplicationFormsSerializer,
    ComplaintsSerializer,
    ContactsSerializer,
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
import xmltodict
from django.views.decorators.csrf import csrf_exempt
import django.db

import base64

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def register_user_scan(request):
    data = request.data.copy()
    print(data)
    # parsed_data = xmltodict.parse(data["xml_str"])
    # return Response(data, status=status.HTTP_201_CREATED)

    # ser = DvUserSerializer(data=data)
    # if ser.is_valid():
    #     model = ser.save()
    # N = 8
    # res = ''.join(random.choices(string.ascii_uppercase + string.digits, k = N)) 
    # return Response(res, status=status.HTTP_201_CREATED)

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def register_user(request):
    data = request.data.copy()
    print(data)
    #print("You are in register user method")
    err = {}
    if "username" not in request.data:
        err["username"] = ["This field is required."]
    if "firstname" not in request.data:
        err["firstname"] = ["This field is required."]
    if "dob" not in request.data:
        err["dob"] = ["This field is required."]
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)

    N = 8
    res = ''.join(random.choices(string.ascii_uppercase + string.digits, k = N)) 
    res_hashed = bcrypt.hashpw(
        res.encode("utf-8"), bcrypt.gensalt()
    )
    decoded_pw = res_hashed.decode("utf-8") 
    try:
        user = DvUser.objects.get(username=request.data["username"])
        return Response(
            data={
                "username": ["This username is already registered."]
            },
            status=status.HTTP_400_BAD_REQUEST,
        )
    except DvUser.DoesNotExist:
        new_user = DvUser(
            username=data["username"],
            password=decoded_pw,
            ispasswordreset = False,
            loginrequired = True,
            scandumpdata = None,
        )
        new_user.save()

        user_address = UserAddress(
            dv_user = new_user,
            houseno = data["houseno"], 
            wardno = data["wardno"],
            street = data["street"],
            pin = data["pin"],
            landmark = data["landmark"]
        )
        user_address.save()

        user_details = UserDetails(
            dv_user = new_user,
            firstname=data["firstname"],
            lastname=data["lastname"],
            aadhaarno=data["aadharno"],
            mobileno = data["mobileno"],
            dob = data["dob"],
            profession = data["profession"],
            user_address = user_address
        )
        user_details.save()

        ser = DvUserSerializer(new_user)
        return Response(res, status=status.HTTP_201_CREATED)

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def reset_password(request):
    err = {}
    if "username" not in request.data:
        err["username"] = ["This field is required."]
    if "password" not in request.data:
        err["password"] = ["This field is required."]
    if "confirmpassword" not in request.data:
        err["confirmpassword"] = ["This field is required."]
    if data["password"]!=data["confirmpassword"]:
        err["confirmpassword"] = ["Passwords don't match"]
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)
    try:
        user = DvUser.objects.get(username=request.data["username"])
        user.ispasswordreset = True
        user.password = data["password"]
        user.save()

        return Response("Success", status=status.HTTP_400_BAD_REQUEST)
    except DvUser.DoesNotExist:
        return Response(
            data={"username": ["No such username exists."]},
            status=status.HTTP_400_BAD_REQUEST,
        )

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def login_user(request):
    err = {}
    if "username" not in request.data:
        err["username"] = ["This field is required."]
    if "password" not in request.data:
        err["password"] = ["This field is required."]
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)
    try:
        user = DvUser.objects.get(username=request.data["username"])
    except DvUser.DoesNotExist:
        return Response(
            data={"username": ["No such username exists."]},
            status=status.HTTP_400_BAD_REQUEST,
        )

    if bcrypt.hashpw(request.data["password"].encode("utf-8"), user.password.encode("utf-8")) == user.password.encode("utf-8"):
        ser = DvUserSerializer(user)
        token = "".join(
            [random.choice(string.ascii_letters) for _ in range(32)]
        )
        new_token = Session(user=user, key=token)
        new_token.save()
        return Response({"token": token})
    else:
        return Response(
            data={"password": ["Incorrect password."]},
            status=status.HTTP_400_BAD_REQUEST,
        )



@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def make_complaint(request):
    data = request.data.copy()
    print(data)
    err = {}
    if "name" not in request.data:
        err["name"] = ["This field is required."]
    if "description" not in request.data:
        err["description"] = ["This field is required."]

    
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)
    new_complaint = Complaints(
        name=data["name"],
        description=data["description"],
        attachmentlink = data["attachment_link"], 
        status = 'open',
        notes = data["notes"],
        category = data["category"]
    )
    new_complaint.save()
    ser = ComplaintsSerializer(new_complaint)
    return Response(ser.data, status=status.HTTP_201_CREATED)

@authentication_classes([])
@permission_classes([])
class ViewComplaints(generics.ListCreateAPIView):
    serializer_class = ComplaintsSerializer
    queryset = Complaints.objects.all()

@authentication_classes([])
@permission_classes([])
class DetailComplaint(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ComplaintsSerializer
    queryset = Complaints.objects.all()

@authentication_classes([])
@permission_classes([])
class RetrieveAllUsers(generics.ListCreateAPIView):
    serializer_class = UserDetailsSerializer
    queryset = UserDetails.objects.all()

@authentication_classes([])
@permission_classes([])
class RetrieveOneUser(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = UserDetailsSerializer
    queryset = UserDetails.objects.all()

class MultipleFieldLookupMixin(object):
    """
    Apply this mixin to any view or viewset to get multiple field filtering
    based on a `lookup_fields` attribute, instead of the default single field filtering.
    """

    def get_object(self):
        queryset = self.get_queryset()  # Get the base queryset
        queryset = self.filter_queryset(queryset)  # Apply any filter backends
        filter = {}
        for field in self.lookup_fields:
            if self.kwargs[field]:  # Ignore empty fields.
                filter[field] = self.kwargs[field]
        obj = get_object_or_404(queryset, **filter)  # Lookup the object
        self.check_object_permissions(self.request, obj)
        return obj


@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def update_details(request):
    data = request.data.copy()
    print(data)
    err = {}
    # if "address" not in request.data:
    #     err["address"] = ["This field is required."]
    if "mobileno" not in request.data:
        err["mobileno"] = ["This field is required."]
    if "profession" not in request.data:
        err["profession"] = ["This field is required."]
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = DvUser.objects.get(username=request.data["username"])
        #user_address = UserAddress.objects.get(user=user)
        user_details = UserDetails.objects.get(dv_user=user)
        user_details.mobileno = data["mobileno"]
        user_details.profession = data["profession"]
        user_details.save()

        if data["add_admin"] == True:
            try:

                user1 = UserRoles.objects.get(user_id=user)
                return Response(
                    data={
                        "username": ["This username is already an admin."]
                    },
                    status=status.HTTP_400_BAD_REQUEST,
                )
            except UserRoles.DoesNotExist:
                assignrole = Role.objects.get(name="admin").role_id
                new_admin = UserRoles(
                    user_id=user.dv_user_id,
                    role_id=assignrole
                )
                new_admin.save()
                ser = UserRolesSerializer(new_admin)

                #insert into contacts
                new_name = str(user_details.firstname + user_details.lastname)
                new_contact = Contacts(
                    name = new_name,
                    mobileno = user_details.mobileno,
                    profession = user_details.profession
                    )
                new_contact.save()
                ser = ContactsSerializer(new_contact)
        return Response("ok", status=status.HTTP_201_CREATED)            

        

    except DvUser.DoesNotExist:
        return Response(
            data={"username": ["No such username exists."]},
            status=status.HTTP_400_BAD_REQUEST,
        )

# @api_view(["POST"])
# @authentication_classes([])
# @permission_classes([])
# def add_admin(request):
    

#     data = request.data.copy()
#     print(data)
#     #print("You are in register user method")
#     err = {}
#     if "username" not in request.data:
#         err["username"] = ["This field is required."]
   
#     if err:
#         return Response(data=err, status=status.HTTP_400_BAD_REQUEST)

#     try:
#         user = DvUser.objects.get(username=request.data["username"]) 

#     except DvUser.DoesNotExist:
#         return Response(
#             data={"username": ["No such username exists."]},
#             status=status.HTTP_400_BAD_REQUEST,
#         )

#     try:

#         user1 = UserRoles.objects.get(user_id=user)
#         return Response(
#             data={
#                 "username": ["This username is already an admin."]
#             },
#             status=status.HTTP_400_BAD_REQUEST,
#         )
#     except UserRoles.DoesNotExist:
#         assignrole = Role.objects.get(name="admin").role_id
#         new_admin = UserRoles(
#             user_id=user.dv_user_id,
#             role_id=assignrole
#         )
#         new_admin.save()

#         ser = UserRolesSerializer(new_admin)
#         return Response("ok", status=status.HTTP_201_CREATED)

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def update_complaint_status(request):
    data = request.data.copy()
    print(data)
    err = {}
    
    if "complaint_id" not in request.data:
        err["complaint_id"] = ["This field is required."]
    if "status" not in request.data:
        err["status"] = ["This field is required."]
    
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)

    try:
        comp = Complaints.objects.get(complaint_id=request.data["complaint_id"])
        #user_address = UserAddress.objects.get(user=user)
        
        comp.status = data["status"]
        #user_details.profession = data["profession"]
        comp.save()

        return Response("Success", status=status.HTTP_400_BAD_REQUEST)

    except Complaints.DoesNotExist:
        return Response(
            data={"complaint_id": ["No such complaint_id exists."]},
            status=status.HTTP_400_BAD_REQUEST,
        )


@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def add_announcement(request):
    data = request.data.copy()
    print(data)
    err = {}
    if "name" not in request.data:
        err["name"] = ["This field is required."]
    if "description" not in request.data:
        err["description"] = ["This field is required."]
    if "validtill" not in request.data:
        err["validtill"] = ["This field is required."]
    
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)
    
    new_announcement = Announcement(
        name=data["name"],
        description=data["description"],
        link = data["link"],
        validtill = data["validtill"],
        format = data["format"],
    )
    new_announcement.save()
    ser = AnnouncementSerializer(new_announcement)
    return Response(ser.data, status=status.HTTP_201_CREATED)

@authentication_classes([])
@permission_classes([])
class ViewAnnouncements(generics.ListCreateAPIView):
    serializer_class = AnnouncementSerializer
    queryset = Announcement.objects.all()

@authentication_classes([])
@permission_classes([])
class DetailAnnouncement(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = AnnouncementSerializer
    queryset = Announcement.objects.all()

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def add_form(request):
    data = request.data.copy()
    print(data)
    err = {}
    if "name" not in request.data:
        err["name"] = ["This field is required."]
    if "description" not in request.data:
        err["description"] = ["This field is required."]
    if "attachmentlink" not in request.data:
        err["attachmentlink"] = ["This field is required."]
    
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)
    
    new_form = ApplicationForms(
        name=data["name"],
        description=data["description"],
        attachmentlink = data["attachmentlink"],
    )
    new_form.save()
    ser = ApplicationFormsSerializer(new_form)
    return Response(ser.data, status=status.HTTP_201_CREATED)

@authentication_classes([])
@permission_classes([])
class ViewForms(generics.ListCreateAPIView):
    serializer_class = ApplicationFormsSerializer
    queryset = ApplicationForms.objects.all()

@authentication_classes([])
@permission_classes([])
class ViewContacts(generics.ListCreateAPIView):
    serializer_class = ContactsSerializer
    queryset = Contacts.objects.all()

@api_view(["POST"])
@authentication_classes([])
@permission_classes([])
def add_dependent(request):
    data = request.data.copy()
    print(data)
    #print("You are in register user method")
    err = {}
    if "firstname" not in request.data:
        err["firstname"] = ["This field is required."]
    if "dob" not in request.data:
        err["dob"] = ["This field is required."]
    if err:
        return Response(data=err, status=status.HTTP_400_BAD_REQUEST)       
  
    new_user = DvUser(
        username= None,
        password= None,
        ispasswordreset = False,
        loginrequired = False,
        scandumpdata = None,
    )
    new_user.save()

    user_address = UserAddress(
        dv_user = new_user,
        houseno = data["houseno"], 
        wardno = data["wardno"],
        street = data["street"],
        pin = data["pin"],
        landmark = data["landmark"]
    )
    user_address.save()

    user_details = UserDetails(
        dv_user = new_user,
        firstname=data["firstname"],
        lastname=data["lastname"],
        aadhaarno=data["aadharno"],
        mobileno = data["mobileno"],
        dob = data["dob"],
        profession = data["profession"],
        user_address = user_address
    )
    user_details.save()

    ser = DvUserSerializer(new_user)
    return Response("Success", status=status.HTTP_201_CREATED)