from django.shortcuts import render
from drf_yasg.utils import swagger_auto_schema
from rest_framework import generics, mixins, status
from .models import WeightRecord
from .serializers import WeightRecordSerializer, WeightRecordCreateSerializer
from rest_framework.response import Response
from rest_framework.views import APIView


class WeightRecordListCreateView(generics.ListCreateAPIView):
    queryset = WeightRecord.objects.all()
    serializer_class = WeightRecordSerializer

    @swagger_auto_schema(responses={200: WeightRecordSerializer(many=True)})
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    @swagger_auto_schema(request_body=WeightRecordCreateSerializer, responses={201: WeightRecordSerializer})
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

class WeightRecordRetrieveView(generics.RetrieveAPIView):
    queryset = WeightRecord.objects.all()
    serializer_class = WeightRecordSerializer

    @swagger_auto_schema(responses={200: WeightRecordSerializer})
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

class WeightRecordUpdateView(mixins.UpdateModelMixin, generics.RetrieveAPIView):
    queryset = WeightRecord.objects.all()
    serializer_class = WeightRecordSerializer

    @swagger_auto_schema(request_body=WeightRecordSerializer, responses={200: WeightRecordSerializer})
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

class WeightRecordDeleteView(mixins.DestroyModelMixin, generics.RetrieveAPIView):
    queryset = WeightRecord.objects.all()
    serializer_class = WeightRecordSerializer

    @swagger_auto_schema(responses={204: 'No content'})
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

class WeightRecordCreateView(APIView):
    @swagger_auto_schema(request_body=WeightRecordCreateSerializer, responses={201: WeightRecordSerializer})
    def post(self, request, format=None):
        serializer = WeightRecordSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
