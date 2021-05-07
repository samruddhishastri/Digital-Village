from rest_framework import authentication, exceptions
from api.models import DvUser, Session

class CustomTokenAuthentication(authentication.BaseAuthentication):
    def authenticate(self, request):
        if "Authorization" not in request.headers:
            return None
        try:
            token = request.headers["Authorization"]
            user = Session.objects.get(key=token).user
        except Session.DoesNotExist:
            raise exceptions.AuthenticationFailed("Invalid token")
        return (user, None)
