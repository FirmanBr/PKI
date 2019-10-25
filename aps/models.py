from django.db import models
from django.contrib.auth.models import User

class UserProfileInfo(models.Model):
  user = models.OneToOneField(User,on_delete=models.CASCADE)
  portfolio_site = models.URLField(blank=True)
  profile_pic = models.ImageField(upload_to='profile_pics',blank=True)
  
  def __str__(self):
    return self.user.username

class mainkey(models.Model):
    no = models.AutoField(primary_key=True)
    id = models.CharField(max_length=100)
    kunci = models.TextField()

    class Meta:
        managed = False
        db_table = 'mainkey'

    def __str__(self):
      return self.no