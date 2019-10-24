from aps.forms import UserForm,UserProfileInfoForm
from cryptography.fernet import Fernet
from datetime import datetime
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from django.urls import reverse
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives.asymmetric import dsa
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives import serialization

import mysql.connector
import pyautogui

def index(request):
    return render(request,'aps/index.html')

@login_required
def create_key(request):
    return render(request, 'aps/newkey.html')    

@login_required
def create_key_submit(request):
    if request.method == 'POST':

        encrypttype = request.POST.get('encrypttype')
        if encrypttype == 'RSA1024':

            encrypttype = encrypttype

            private_key_rsa = rsa.generate_private_key(
                public_exponent=65537,
                key_size=1024,
                backend=default_backend()
            )

            kuncipub1 = private_key_rsa.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.BestAvailableEncryption(b'{{ encrypttype }}')
                )

            public_key = private_key_rsa.public_key()
            kuncipub = public_key.public_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PublicFormat.SubjectPublicKeyInfo
            )
                   
        elif encrypttype =='ECDSA1024':

            encrypttype = encrypttype

            private_key_ecdsa = ec.generate_private_key(
                ec.SECP384R1(), default_backend()
            )

            data = b"{{ encrypttype }}"
            
            signature = private_key_ecdsa.sign(
                data,
                ec.ECDSA(hashes.SHA256())
            ) 

            public_key = private_key_ecdsa.public_key()
            hasil = public_key.verify(signature, data, ec.ECDSA(hashes.SHA256()))

            kuncipub = hasil
            kuncipub1 = signature

        elif encrypttype =='DSA1024':

            encrypttype = encrypttype
            
            private_key_dsa = dsa.generate_private_key(
                key_size=1024,
                backend=default_backend()
            )

            data = b"{{ encrypttype }}"
            
            signature = private_key_dsa.sign(
                data,
                hashes.SHA256()
            )

            public_key = private_key_dsa.public_key()

            hasil = public_key.verify(
                signature,
                data,
                hashes.SHA256()
            )

            kuncipub = hasil
            kuncipub1 = signature

        elif encrypttype =='HASH256':

            encrypttype = encrypttype

            digest = hashes.Hash(hashes.SHA256(), backend=default_backend())
            digest.update(b"{{ encrypttype }}")
            hasil = digest.finalize()

            kuncipub = 'none'
            kuncipub1 = hasil
        
        else :
            kuncipub = 'Failed'
            kuncipub1 = 'Failed'            
            
        context= {
            'public': kuncipub,
            'private':kuncipub1,
        }

        
        return render(request, 'aps/newkey.html',context)

    else :   
        pyautogui.alert('Failed')
        return render(request, 'aps/newkey.html')
      
@login_required
def key_submit(request):
    if request.method == 'POST':
        pyautogui.alert('Save Sucesfully')
        return render(request, 'aps/newkey.html')
    else :   
        pyautogui.alert('Failed')
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

        
        