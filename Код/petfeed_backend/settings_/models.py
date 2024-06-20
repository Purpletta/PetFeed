from django.db import models
from authorisation.models import User
class Setting(models.Model):
    settings_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    theme = models.BooleanField()
    language = models.CharField(max_length=50)

    def __str__(self):
        return self.theme

    class Meta:
        db_table = 'settings'