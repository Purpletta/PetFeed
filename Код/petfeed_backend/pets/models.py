from django.db import models
from authorisation.models import User

class Pet(models.Model):
    pet_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    pet_name = models.CharField(max_length=50)
    pet_type = models.BooleanField()
    pet_age = models.IntegerField()
    pet_weight = models.FloatField()
    pet_sterilized = models.BooleanField()
    pet_diseases = models.TextField()
    pet_sex = models.BooleanField()

    def __str__(self):
        return self.pet_name

    class Meta:
        db_table = 'pets'
