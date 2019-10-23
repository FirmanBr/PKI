from django.shortcuts import render
from aps.forms import UserForm,UserProfileInfoForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages

from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse

import pyautogui

import mysql.connector

from datetime import datetime

from cryptography.fernet import Fernet

def index(request):
    return render(request,'aps/index.html')

@login_required
def create_key(request):
    return render(request, 'aps/newkey.html')    

@login_required
def create_key_submit(request):
    if request.method == 'POST':
        encrypttype = request.POST.get('encrypttype')
        context= {
            'hasil': encrypttype,
        }
        return render(request, 'aps/newkey.html',context)
    else :   
        pyautogui.alert('Failed')
        return render(request, 'aps/newkey.html')
      
@login_required
def key_submit(request):
    if request.method == 'POST':
        pyautogui.alert('berhasil')
        return render(request, 'aps/newkey.html')
    else :   
        pyautogui.alert('gagal')
        return render(request, 'aps/newkey.html')      

@login_required
def master_key(request):
    return render(request, 'aps/masterkey.html') 

@login_required
def master_key_submit(request):
        if request.method == 'POST':

            db = mysql.connector.connect(host='localhost',database='pki',user='root',password='')
            cursor = db.cursor(buffered=True)

            nik = request.POST.get('id')
            username = request.POST.get('username')

            message = username.encode()
            key = Fernet.generate_key()
            f = Fernet(key)
            encrypted = f.encrypt(message)
 
            sql1 = "insert into masterkey(no, id, kunci) VALUES(%s, %s,%s)"
            val = ("",nik,encrypted)

            cursor.execute(sql1,val)
            db.commit()

            pyautogui.alert('Master Key Created')
            return render(request, 'aps/masterkey.html') 
        else :
            pyautogui.alert('Failed')  
            return render(request, 'aps/masterkey.html') 

@login_required
def special(request):
    return HttpResponse("You are logged in !")

@login_required
def user_logout(request):
    logout(request)
    return HttpResponseRedirect(reverse('index'))

def about(request):
    return render(request, 'aps/about.html')   

def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request,user)
                return HttpResponseRedirect(reverse('index'))
            else:
                return HttpResponse("Your account was inactive.")
        else:
            print("Someone tried to login and failed.")
            print("They used username: {} and password: {}".format(username,password))
            pyautogui.alert('Please check again your Username or Password')
            return render(request, 'aps/login.html', {})
    else:
        return render(request, 'aps/login.html', {})

        
        