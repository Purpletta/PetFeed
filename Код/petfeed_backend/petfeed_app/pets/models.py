from django.db import models

class Pet(models.Model):
    pet_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    type = models.BooleanField()
    age = models.IntegerField()
    weight = models.FloatField()
    sterilized = models.BooleanField()
    diseases = models.TextField()
    sex = models.BooleanField()
