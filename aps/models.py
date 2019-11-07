from django.db import models
from django.contrib.auth.models import User
from django.shortcuts import render
from django.db.models.signals import post_save
from django.dispatch import receiver

class Profile(models.Model):
    Admin = 1
    CSCA = 2
    DS = 3
    IS = 4
    MLS = 5
    DLS = 6
    ROLE_CHOICES = (
        (Admin, 'Administrator'),
        (CSCA, 'Country Signing Certification Authority'),
        (DS, 'Document Signer'),
        (IS, 'Inspection System'),
        (MLS, 'Master List Signer'),
        (DLS, 'Document List Signer'),
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    role = models.PositiveSmallIntegerField(choices=ROLE_CHOICES, null=True, blank=True)

    def __str__(self):  
        return self.user.username

@receiver(post_save, sender=User)
def create_or_update_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()

class UserProfileInfo(models.Model):
  user = models.OneToOneField(User,on_delete=models.CASCADE)
  portfolio_site = models.URLField(blank=True)
  profile_pic = models.ImageField(upload_to='profile_pics',blank=True)
  
  def __str__(self):
    return self.user.username

class mainkey(models.Model):
    no = models.AutoField(primary_key=True)
    id = models.CharField(max_length=100)
    key_name = models.TextField()
    time_start = models.TimeField()

    class Meta:
        managed = True
        db_table = 'mainkey'

    def __str__(self):
      return self.kunci

class PairKeyReq(models.Model):
    no = models.AutoField(primary_key=True)
    masterkey = models.CharField(max_length=100)
    organization = models.CharField(max_length=100,null=True)
    negara = models.CharField(max_length=100)
    kota = models.CharField(max_length=100)
    provinsi = models.CharField(max_length=100)            
    jalan = models.CharField(max_length=100)
    pos = models.CharField(max_length=100)
    status = models.CharField(max_length=10,null=True)        
    bit = models.FloatField(max_length=100,null=True)   
    jenis = models.FloatField(max_length=100,null=True)    
    privkey = models.TextField(null=True)    
    pubkey = models.TextField(null=True)    






    