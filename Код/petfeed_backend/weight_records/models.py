from django.db import models

from pets.models import Pet
class WeightRecord(models.Model):
    record_id = models.AutoField(primary_key=True)
    pet = models.ForeignKey(Pet, on_delete=models.CASCADE)
    record_date = models.DateField()
    weight = models.FloatField()

    def __str__(self):
        return self.weight

    class Meta:
        db_table = 'weight_records'