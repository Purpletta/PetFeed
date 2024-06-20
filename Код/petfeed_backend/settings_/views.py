from django.shortcuts import render
from drf_yasg.utils import swagger_auto_schema
from rest_framework import generics, mixins, status
from .models import Setting
from .serializers import SettingSerializer, SettingCreateSerializer
from rest_framework.response import Response
from rest_framework.views import APIView


class SettingListCreateView(generics.ListCreateAPIView):
    queryset = Setting.objects.all()
    serializer_class = SettingSerializer

    @swagger_auto_schema(responses={200: SettingSerializer(many=True)})
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    @swagger_auto_schema(request_body=SettingCreateSerializer, responses={201: SettingSerializer})
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

class SettingRetrieveView(generics.RetrieveAPIView):
    queryset = Setting.objects.all()
    serializer_class = SettingSerializer

    @swagger_auto_schema(responses={200: SettingSerializer})
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

class SettingUpdateView(mixins.UpdateModelMixin, generics.RetrieveAPIView):
    queryset = Setting.objects.all()
    serializer_class = SettingSerializer

    @swagger_auto_schema(request_body=SettingSerializer, responses={200: SettingSerializer})
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

class SettingDeleteView(mixins.DestroyModelMixin, generics.RetrieveAPIView):
    queryset = Setting.objects.all()
    serializer_class = SettingSerializer

    @swagger_auto_schema(responses={204: 'No content'})
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

class SettingCreateView(APIView):
    @swagger_auto_schema(request_body=SettingCreateSerializer, responses={201: SettingSerializer})
    def post(self, request, format=None):
        serializer = SettingSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
