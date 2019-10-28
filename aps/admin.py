from django.contrib import admin
from django.db import models
from aps.models import UserProfileInfo, User
from .models import Profile
from django.contrib.auth.admin import UserAdmin

class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'

class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline, )

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)

admin.site.register(UserProfileInfo)
admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)


