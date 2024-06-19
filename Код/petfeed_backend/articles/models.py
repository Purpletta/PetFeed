from django.db import models

class Article(models.Model):
    article_id = models.AutoField(primary_key=True)
    article_title = models.CharField(max_length=100)
    article_content = models.TextField()
    article_data = models.DateField()
    author = models.CharField(max_length=50)

    def __str__(self):
        return self.article_title

    class Meta:
        db_table = 'articles'