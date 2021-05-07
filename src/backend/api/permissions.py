from rest_framework import permissions

class ReadWriteProtected(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.u != None
