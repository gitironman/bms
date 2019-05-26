"""BMS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from app01 import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.list_book, name='list_book'),
    path('add_book', views.add_book, name='add_book'),
    path('del_book/', views.del_book, name='del_book'),
    re_path(r'^edit_book/(?P<book_id>\d+)/$', views.edit_book, name='edit_book'),
    re_path(r'^code_img/.*?$', views.code_img, name='code_img'),
    path('logout/', views.logout, name='logout'),
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('set_pwd/', views.set_pwd, name='set_pwd'),
]
