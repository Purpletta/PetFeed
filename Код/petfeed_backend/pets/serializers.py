from rest_framework import serializers
from .models import Pet
from authorisation.models import User

class PetSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())
    class Meta:
        model = Pet
        fields = ('pet_id', 'user', 'pet_name', 'pet_type', 'pet_age', 'pet_weight', 'pet_sterilized', 'pet_diseases', 'pet_sex')

    def update(self, instance, validated_data):
        instance.user_id = validated_data.get('user', instance.user_id)
        instance.pet_name = validated_data.get('pet_name', instance.pet_name)
        instance.pet_type = validated_data.get('pet_type', instance.pet_type)
        instance.pet_age = validated_data.get('pet_age', instance.pet_age)
        instance.pet_weight = validated_data.get('pet_weight', instance.pet_weight)
        instance.pet_sterilized = validated_data.get('pet_sterilized', instance.pet_sterilized)
        instance.pet_diseases = validated_data.get('pet_diseases', instance.pet_diseases)
        instance.pet_sex = validated_data.get('pet_sex', instance.pet_sex)
        instance.save()
        return instance

    def destroy(self, instance):
        instance.delete()

class PetCreateSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())
    class Meta:
        model = Pet
        fields = ('pet_id', 'user', 'pet_name', 'pet_type', 'pet_age', 'pet_weight', 'pet_sterilized', 'pet_diseases', 'pet_sex')
