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

class DjangoX509Ca(models.Model):
    name = models.CharField(max_length=64)
    notes = models.TextField()
    key_length = models.CharField(max_length=6)
    digest = models.CharField(max_length=8)
    validity_start = models.DateTimeField(blank=True, null=True)
    validity_end = models.DateTimeField(blank=True, null=True)
    country_code = models.CharField(max_length=2)
    state = models.CharField(max_length=64)
    city = models.CharField(max_length=64)
    organization_name = models.CharField(max_length=64)
    email = models.CharField(max_length=254)
    common_name = models.CharField(max_length=63)
    extensions = models.TextField()
    serial_number = models.CharField(max_length=39, blank=True, null=True)
    certificate = models.TextField()
    private_key = models.TextField()
    created = models.DateTimeField()
    modified = models.DateTimeField()
    organizational_unit_name = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'django_x509_ca'


class DjangoX509Cert(models.Model):
    name = models.CharField(max_length=64)
    notes = models.TextField()
    key_length = models.CharField(max_length=6)
    digest = models.CharField(max_length=8)
    validity_start = models.DateTimeField(blank=True, null=True)
    validity_end = models.DateTimeField(blank=True, null=True)
    country_code = models.CharField(max_length=2)
    state = models.CharField(max_length=64)
    city = models.CharField(max_length=64)
    organization_name = models.CharField(max_length=64)
    email = models.CharField(max_length=254)
    common_name = models.CharField(max_length=63)
    extensions = models.TextField()
    serial_number = models.CharField(max_length=39, blank=True, null=True)
    certificate = models.TextField()
    private_key = models.TextField()
    created = models.DateTimeField()
    modified = models.DateTimeField()
    revoked = models.IntegerField()
    revoked_at = models.DateTimeField(blank=True, null=True)
    ca = models.ForeignKey(DjangoX509Ca, models.DO_NOTHING)
    organizational_unit_name = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'django_x509_cert'
        unique_together = (('ca', 'serial_number'),)

    