from rest_framework import serializers
from .models import Users, Settings, Pets, Weight_Records, Pet_Feeds, Foods, Articles

class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = '__all__'

class SettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Settings
        fields = '__all__'

class PetsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pets
        fields = '__all__'

class Weight_RecordsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Weight_Records
        fields = '__all__'

class Pet_FeedsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pet_Feeds
        fields = '__all__'

class FoodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Foods
        fields = '__all__'

class ArticlesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Articles
        fields = '__all__'
