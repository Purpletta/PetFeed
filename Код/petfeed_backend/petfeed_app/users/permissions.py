from rest_framework import permissions

class IsOwnerOrReadOnly(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        return obj == request.user

class IsUnauthenticated(permissions.BasePermission):
    def has_permission(self, request, view):
        return not request.user.is_authenticated

class IsAuthenticated(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated

class IsPremium(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.premium
