@echo off
:start


mkdir %1
cd %1


py -m venv .env
call .env\Scripts\activate

pip install django
django-admin startproject %1
cd %1

echo NOTES > notes.txt
echo #BROUILLON > brouillon.py

if "%2"=="" (set app_name=Main) else (set app_name=%2)
python manage.py startapp %app_name%
cd %app_name%

(
	echo.
	echo from django.urls import path
	echo.
	echo. 
	echo urlpatterns = [
	echo.
	echo ]
) >urls.py


