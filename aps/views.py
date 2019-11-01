from aps.forms import UserForm,UserProfileInfoForm
from cryptography.fernet import Fernet
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
from .models import mainkey,Profile


import base64
import datetime
import hvac
import mysql.connector
import pyautogui
import pybase64
import sys
import time





db = mysql.connector.connect(host='localhost',database='pkilen',user='root',password='')
key = Fernet.generate_key()
f = Fernet(key)

client = hvac.Client(url='http://127.0.0.1:8200')

auth = Profile.objects.all()
job = {'auth': auth}

def index(request):
    return render(request,'aps/index.html')

@login_required
def create_key(request):

    test = mainkey.objects.all()[:1]
    context = {'test': test}

    return render(request, 'aps/newkey.html', context )   
    
@login_required
def create_key_submit(request):
    if request.method == 'POST':
        
        #sql_select_Query = "select kunci from mainkey where id = '{{comparison}}' "
        #cursor = db.cursor()
        #cursor.execute(sql_select_Query)
        
        #print(cursor.fetchall()) 
        
        #coba = f.decrypt(b) 
        #pyautogui.alert(coba)

        encrypttype = request.POST.get('encrypttype')
        bit         = request.POST.get('bit')    

        if encrypttype == 'RSA':

            if bit  =='512':
                bit = 512
            elif bit  =='1024':
                bit = 1024
            else :
                bit = 2048           
            
            encrypttype = encrypttype

            private_key_rsa = rsa.generate_private_key(
                public_exponent=65537,
                key_size= bit ,
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
                   
        elif encrypttype =='ECDSA':

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

        elif encrypttype =='DSA':

            if bit  =='1024':
                bit = 1024
            elif bit  =='2048':
                bit = 2048
            else :
                bit = 3072   

            encrypttype = encrypttype
            
            private_key_dsa = dsa.generate_private_key(
                key_size=bit,
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

        elif encrypttype =='HASH':

            encrypttype = encrypttype

            if bit == 'SHA224': 
                key = hashes.SHA224()
            elif  bit == 'SHA256': 
                key = hashes.SHA256()  
            elif  bit == 'SHA384': 
                key = hashes.SHA384()
            else :
                key = hashes.SHA512()                

            digest = hashes.Hash(key, backend=default_backend())
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

    test = mainkey.objects.all()[:1]
    context = {'test': test}
    return render(request, 'aps/masterkey.html' , context ) 

@login_required
def master_key_submit(request):
        if request.method == 'POST':

            def base64ify(bytes_or_str):
                if sys.version_info[0] >= 3 and isinstance(bytes_or_str, str):
                    input_bytes = bytes_or_str.encode('utf8')
                else:
                    input_bytes = bytes_or_str

                output_bytes = base64.urlsafe_b64encode(input_bytes)
    
                if sys.version_info[0] >= 3:
                    return output_bytes.decode('ascii')
                else:
                    return output_bytes
            
            
            cursor = db.cursor(buffered=True)

            nik = request.POST.get('id')
            keyname = request.POST.get('keyname')


            client.secrets.transit.create_key(name=keyname)

            client.secrets.transit.update_key_configuration(
                name=keyname,                
                deletion_allowed=True,
                exportable=True,
            )

            export_key_response = client.secrets.transit.export_key(
                name=keyname,
                key_type='hmac-key',
            )

            ts = time.time()
            timestamp = (datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S'))
            key = export_key_response['data']['keys']
        
            sql1 = "insert into mainkey(no, id, key_name, time_start) VALUES(%s, %s, %s, %s)"
            val = ("",nik,keyname,timestamp)

            cursor.execute(sql1,val)
            db.commit()

            pyautogui.alert('Master Key Created')
            return render(request, 'aps/index.html')  

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

                return render(request, 'aps/index.html')

            else:
                return HttpResponse("Your account was inactive.")
        else:
            print("Someone tried to login and failed.")
            print("They used username: {} and password: {}".format(username,password))
            pyautogui.alert('Please check again your Username or Password')
            return render(request, 'aps/login.html', {})
    else:
        return render(request, 'aps/login.html', {})

@login_required
def list_key(request):

    test = mainkey.objects.all()
    context = {'test': test}

    return render(request, 'aps/list_key.html', context)  

@login_required
def rotate_key_master(request) :
    if request.method == 'POST':
        keyname = request.POST.get('keyname')
        client.secrets.transit.rotate_key(name=keyname)
        pyautogui.alert('Rotete Key Sucess') 
        return render(request, 'aps/index.html') 
    else :
        pyautogui.alert('Rotete Key Failed')  
        return render(request, 'aps/list_key.html') 

@login_required
def delete_key_master(request) :
    if request.method == 'POST':
        keyname = request.POST.get('keydelete')
        cursor = db.cursor(buffered=True)
        sql1 = """Delete from mainkey where key_name = %s"""
        val = keyname
        cursor.execute(sql1,(val,))
        db.commit()
        client.secrets.transit.delete_key(name=keyname)
        pyautogui.alert('Delete Key Sucess') 
        return render(request, 'aps/index.html') 
    else :
        pyautogui.alert('Delete Keys Key Failed')  
        return render(request, 'aps/list_key.html') 

@login_required
def requestcsca(request):

    return render(request, 'aps/requestcsca.html') 


        
        