from rest_framework import serializers
from .models import Article

class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ('article_id', 'article_title', 'article_data', 'article_content', 'author')

    def update(self, instance, validated_data):
        instance.article_title = validated_data.get('article_title', instance.article_title)
        instance.article_content = validated_data.get('article_content', instance.article_content)
        instance.article_data = validated_data.get('article_data', instance.article_data)
        instance.author = validated_data.get('author', instance.author)
        instance.save()
        return instance

    def destroy(self, instance):
        instance.delete()

class ArticleCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ('article_title', 'article_data', 'article_content', 'author')
