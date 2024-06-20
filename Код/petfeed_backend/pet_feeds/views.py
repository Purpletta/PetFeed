from django.shortcuts import render
from drf_yasg.utils import swagger_auto_schema
from rest_framework import generics, mixins, status
from .models import PetFeed
from .serializers import PetFeedSerializer, PetFeedCreateSerializer
from rest_framework.response import Response
from rest_framework.views import APIView


class PetFeedListCreateView(generics.ListCreateAPIView):
    queryset = PetFeed.objects.all()
    serializer_class = PetFeedSerializer

    @swagger_auto_schema(responses={200: PetFeedSerializer(many=True)})
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    @swagger_auto_schema(request_body=PetFeedCreateSerializer, responses={201: PetFeedSerializer})
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

class PetFeedRetrieveView(generics.RetrieveAPIView):
    queryset = PetFeed.objects.all()
    serializer_class = PetFeedSerializer

    @swagger_auto_schema(responses={200: PetFeedSerializer})
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

class PetFeedUpdateView(mixins.UpdateModelMixin, generics.RetrieveAPIView):
    queryset = PetFeed.objects.all()
    serializer_class = PetFeedSerializer

    @swagger_auto_schema(request_body=PetFeedSerializer, responses={200: PetFeedSerializer})
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

class PetFeedDeleteView(mixins.DestroyModelMixin, generics.RetrieveAPIView):
    queryset = PetFeed.objects.all()
    serializer_class = PetFeedSerializer

    @swagger_auto_schema(responses={204: 'No content'})
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

class PetFeedCreateView(APIView):
    @swagger_auto_schema(request_body=PetFeedCreateSerializer, responses={201: PetFeedSerializer})
    def post(self, request, format=None):
        serializer = PetFeedSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
