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
        managed = True
        db_table = 'mainkey'

    def __str__(self):
      return self.no

class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()
    acces = models.CharField(max_length=250)

    class Meta:
        managed = False
        db_table = 'auth_user'