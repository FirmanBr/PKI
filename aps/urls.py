from django.conf.urls import url
from django.urls import path
from aps import views


app_name = 'aps'

urlpatterns=[
    url(r'^about/$',views.about,name='about'),
    url(r'^user_login/$',views.user_login,name='user_login'),
    url(r'^master_key_submit/$',views.master_key_submit,name='master_key_submit'),
    url(r'^create_key/$',views.create_key,name='create_key'),
    url(r'^list_key/$',views.list_key,name='list_key'),
    url(r'^create_key_submit/$',views.create_key_submit,name='create_key_submit'),
    url(r'^key_submit/$',views.key_submit,name='key_submit'),
    url(r'^master_key/$',views.master_key,name='master_key'),
    url(r'^validkey/$',views.validkey,name='validkey'),
    url(r'^validkeysubmit/$',views.validkeysubmit,name='validkeysubmit'),
    url(r'^rotate_key_master/$',views.rotate_key_master,name='rotate_key_master'),
    url(r'^delete_key_master/$',views.delete_key_master,name='delete_key_master'),
    url(r'^requestkey/$',views.requestkey,name='requestkey'),
    url(r'^caapprov/$',views.caapprov,name='caapprov'),   
    url(r'^keypairca/$',views.keypairca,name='keypairca'),  
    url(r'^listkeyca/$',views.listkeyca,name='listkeyca'),    
    url(r'^requestcsca/$',views.requestcsca,name='requestcsca'),
]

