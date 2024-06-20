from django.db import models

class Food(models.Model):
    food_id = models.AutoField(primary_key=True)
    feed_name = models.CharField(max_length=50)
    energy_value = models.FloatField()
    info = models.TextField()

    def __str__(self):
        return self.feed_name

    class Meta:
        db_table = 'foods'
