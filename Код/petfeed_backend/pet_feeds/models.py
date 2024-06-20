from django.db import models
from foods.models import Food
from pets.models import Pet
class PetFeed(models.Model):
    pet_feed_id = models.AutoField(primary_key=True)
    pet = models.ForeignKey(Pet, on_delete=models.CASCADE)
    food = models.ForeignKey(Food, on_delete=models.CASCADE)
    feed_quanity = models.FloatField()
    feed_time = models.DateField()

    def __str__(self):
        return self.feed_quantity

    class Meta:
        db_table = 'pet_feeds'