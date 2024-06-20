from rest_framework import serializers
from .models import Food

class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = ('food_id', 'feed_name', 'energy_value', 'info')
    def update(self, instance, validated_data):
        instance.feed_name = validated_data.get('feed_name', instance.feed_name)
        instance.energy_value = validated_data.get('energy_value', instance.energy_value)
        instance.info = validated_data.get('info', instance.info)
        instance.save()
        return instance
    def destroy(self, instance):
        instance.delete()

class FoodCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = ('food_id', 'feed_name', 'energy_value', 'info')
