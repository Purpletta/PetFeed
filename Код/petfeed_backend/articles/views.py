from django.shortcuts import render
from drf_yasg.utils import swagger_auto_schema
from rest_framework import generics, mixins
from .models import Article
from .serializers import ArticleSerializer, ArticleCreateSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

class ArticleListCreateView(generics.ListCreateAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    @swagger_auto_schema(responses={200: ArticleSerializer(many=True)})
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    @swagger_auto_schema(request_body=ArticleCreateSerializer, responses={201: ArticleSerializer})
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

class ArticleRetrieveView(generics.RetrieveAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    @swagger_auto_schema(responses={200: ArticleSerializer})
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

class ArticleUpdateView(mixins.UpdateModelMixin, generics.RetrieveAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    @swagger_auto_schema(request_body=ArticleSerializer, responses={200: ArticleSerializer})
    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

class ArticleDeleteView(mixins.DestroyModelMixin, generics.RetrieveAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    @swagger_auto_schema(responses={204: 'No content'})
    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)

class ArticleCreateView(APIView):
    @swagger_auto_schema(request_body=ArticleCreateSerializer, responses={201: ArticleSerializer})
    def post(self, request, format=None):
        serializer = ArticleSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
