from rest_framework import viewsets
from .models import User
from .serializers import UserSerializer
from rest_framework import generics, permissions
from . import permissions as user_permissions
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class UserCreate(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = [user_permissions.IsUnauthenticated]
    serializer_class = UserSerializer

class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    permission_classes = [user_permissions.IsPremium]
    serializer_class = UserSerializer