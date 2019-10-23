from django.conf.urls import url
from aps import views

app_name = 'aps'

urlpatterns=[
    url(r'^about/$',views.about,name='about'),
    url(r'^user_login/$',views.user_login,name='user_login'),
    url(r'^master_key_submit/$',views.master_key_submit,name='master_key_submit'),
    url(r'^create_key/$',views.create_key,name='create_key'),
    url(r'^master_key/$',views.master_key,name='master_key'),
]

