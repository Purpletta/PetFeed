from rest_framework import serializers
from .models import WeightRecord
from pets.models import Pet

class WeightRecordSerializer(serializers.ModelSerializer):
    pet = serializers.PrimaryKeyRelatedField(queryset=Pet.objects.all())
    class Meta:
        model = WeightRecord
        fields = ('record_id', 'pet', 'record_date', 'weight')

    def update(self, instance, validated_data):
        instance.pet = validated_data.get('pet', instance.pet)
        instance.record_date = validated_data.get('record_date', instance.record_date)
        instance.weight = validated_data.get('weight', instance.weight)
        instance.save()
        return instance

    def destroy(self, instance):
        instance.delete()

class WeightRecordCreateSerializer(serializers.ModelSerializer):
    pet = serializers.PrimaryKeyRelatedField(queryset=Pet.objects.all())
    class Meta:
        model = WeightRecord
        fields = ('record_id', 'pet', 'record_date', 'weight')
