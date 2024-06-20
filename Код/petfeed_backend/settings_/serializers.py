from rest_framework import serializers
from .models import Setting
from authorisation.models import User

class SettingSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())
    class Meta:
        model = Setting
        fields = ('settings_id', 'user', 'theme', 'language')

    def update(self, instance, validated_data):
        instance.user = validated_data.get('user', instance.user)
        instance.theme = validated_data.get('theme', instance.theme)
        instance.language = validated_data.get('language', instance.language)
        instance.save()
        return instance

    def destroy(self, instance):
        instance.delete()

class SettingCreateSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())
    class Meta:
        model = Setting
        fields = ('settings_id', 'user', 'theme', 'language')
