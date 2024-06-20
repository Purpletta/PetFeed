from django.shortcuts import render
from rest_framework import viewsets, status, generics, mixins
from rest_framework.response import Response
from drf_yasg.utils import swagger_auto_schema
from .models import User
from .serializers import UserSerializer, UserCreateSerializer
from rest_framework.views import APIView


class UserListCreateView(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


    @swagger_auto_schema(responses={200: UserSerializer(many=True)})
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    @swagger_auto_schema(request_body=UserCreateSerializer, responses={201: UserSerializer})
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

class UserRetrieveView(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


    @swagger_auto_schema(responses={200: UserSerializer})
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

class UserUpdateView(mixins.UpdateModelMixin, generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


    @swagger_auto_schema(request_body=UserSerializer, responses={200: UserSerializer})
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

class UserDeleteView(mixins.DestroyModelMixin, generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


    @swagger_auto_schema(responses={204: 'No content'})
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

class UserCreateView(APIView):
    @swagger_auto_schema(request_body=UserCreateSerializer, responses={201: UserSerializer})
    def post(self, request, format=None):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
