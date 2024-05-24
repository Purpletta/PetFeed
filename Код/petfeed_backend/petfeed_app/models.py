from django.db import models

class Users(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    premium = models.BooleanField(default=False)

    def __str__(self):
        return self.username
class Settings(models.Model):
    settings_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE)
    theme = models.BooleanField(default=True)
    language = models.CharField(max_length=10)

    def __str__(self):
        return f"{self.user_id.username} settings"

class Pets(models.Model):
    pet_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE)
    pet_name = models.CharField(max_length=50)
    pet_type = models.BooleanField()
    pet_age = models.IntegerField()
    pet_weight = models.FloatField()
    pet_sterilized = models.BooleanField()
    pet_diseases = models.TextField()
    pet_sex = models.BooleanField()

    def __str__(self):
        return self.pet_name

class Weight_Records(models.Model):
    record_id = models.AutoField(primary_key=True)
    pet_id = models.ForeignKey(Pets, on_delete=models.CASCADE)
    record_date = models.DateField()
    weight = models.FloatField()

    def __str__(self):
        return f"{self.record_date} - {self.weight} kg"

class Pet_Feeds(models.Model):
    pet_feed_id = models.AutoField(primary_key=True)
    pet_id = models.ForeignKey(Pets, on_delete=models.CASCADE)
    food_id = models.ForeignKey(Foods, on_delete=models.CASCADE)
    feed_quanity = models.FloatField()
    feed_time = models.DateField()

    def __str__(self):
        return f"{self.feed_time} - {self.food_id.feed_name} - {self.feed_quanity} g"

class Foods(models.Model):
    food_id = models.AutoField(primary_key=True)
    feed_name = models.CharField(max_length=50)
    energy_value = models.FloatField()
    Info = models.TextField()

    def __str__(self):
        return self.feed_name

class Articles(models.Model):
    article_id = models.AutoField(primary_key=True)
    article_title = models.CharField(max_length=100)
    article_content = models.TextField()
    article_data = models.DateField()
    author = models.CharField(max_length=50)

    def __str__(self):
        return self.article_title
