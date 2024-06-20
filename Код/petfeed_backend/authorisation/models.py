from django.db import models

class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    email = models.EmailField(max_length=50)
    premium = models.BooleanField(default=False)

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'users'