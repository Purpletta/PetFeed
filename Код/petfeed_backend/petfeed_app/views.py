from rest_framework import viewsets
from .models import Users, Settings, Pets, Weight_Records, Pet_Feeds, Foods, Articles
from .serializers import UsersSerializer, SettingsSerializer, PetsSerializer, Weight_RecordsSerializer, Pet_FeedsSerializer, FoodsSerializer, ArticlesSerializer

class UsersViewSet(viewsets.ModelViewSet):
    queryset = Users.objects.all()
    serializer_class = UsersSerializer

class SettingsViewSet(viewsets.ModelViewSet):
    queryset = Settings.objects.all()
    serializer_class = SettingsSerializer

class PetViewSet(viewsets.ModelViewSet):
    queryset = Pets.objects.all()
    serializer_class = PetsSerializer

class Weight_RecordsViewSet(viewsets.ModelViewSet):
    queryset = Weight_Records.objects.all()
    serializer_class = Weight_RecordsSerializer

class Pet_FeedsViewSet(viewsets.ModelViewSet):
    queryset = Pet_Feeds.objects.all()
    serializer_class = Pet_FeedsSerializer

class FoodsViewSet(viewsets.ModelViewSet):
    queryset = Foods.objects.all()
    serializer_class = FoodsSerializer


class ArticleViewSet:
    queryset = Articles.objects.all()
    serializer_class = ArticlesSerializer