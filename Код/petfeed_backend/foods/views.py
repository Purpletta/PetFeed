from django.shortcuts import render
from drf_yasg.utils import swagger_auto_schema
from rest_framework import generics, mixins, status
from .models import Food
from .serializers import FoodSerializer, FoodCreateSerializer
from rest_framework.response import Response
from rest_framework.views import APIView


class FoodListCreateView(generics.ListCreateAPIView):
    queryset = Food.objects.all()
    serializer_class = FoodSerializer

    @swagger_auto_schema(responses={200: FoodSerializer(many=True)})
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    @swagger_auto_schema(request_body=FoodCreateSerializer, responses={201: FoodSerializer})
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

class FoodRetrieveView(generics.RetrieveAPIView):
    queryset = Food.objects.all()
    serializer_class = FoodSerializer

    @swagger_auto_schema(responses={200: FoodSerializer})
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

class FoodUpdateView(mixins.UpdateModelMixin, generics.RetrieveAPIView):
    queryset = Food.objects.all()
    serializer_class = FoodSerializer

    @swagger_auto_schema(request_body=FoodSerializer, responses={200: FoodSerializer})
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

class FoodDeleteView(mixins.DestroyModelMixin, generics.RetrieveAPIView):
    queryset = Food.objects.all()
    serializer_class = FoodSerializer

    @swagger_auto_schema(responses={204: 'No content'})
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

class FoodCreateView(APIView):
    @swagger_auto_schema(request_body=FoodCreateSerializer, responses={201: FoodSerializer})
    def post(self, request, format=None):
        serializer = FoodSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
