from rest_framework import serializers
from .models import PetFeed
from pets.models import Pet
from foods.models import Food

class PetFeedSerializer(serializers.ModelSerializer):
    pet = serializers.PrimaryKeyRelatedField(queryset=Pet.objects.all())
    food = serializers.PrimaryKeyRelatedField(queryset=Food.objects.all())
    class Meta:
        model = PetFeed
        fields = ('pet_feed_id', 'pet', 'food', 'feed_quanity', 'feed_time')

    def update(self, instance, validated_data):
        instance.pet = validated_data.get('pet', instance.pet)
        instance.food = validated_data.get('food', instance.food)
        instance.feed_quanity = validated_data.get('feed_quanity', instance.feed_quanity)
        instance.feed_time = validated_data.get('feed_time', instance.feed_time)
        instance.save()
        return instance

    def destroy(self, instance):
        instance.delete()

class PetFeedCreateSerializer(serializers.ModelSerializer):
    pet = serializers.PrimaryKeyRelatedField(queryset=Pet.objects.all())
    food = serializers.PrimaryKeyRelatedField(queryset=Food.objects.all())
    class Meta:
        model = PetFeed
        fields = ('pet_feed_id', 'pet', 'food', 'feed_quanity', 'feed_time')
