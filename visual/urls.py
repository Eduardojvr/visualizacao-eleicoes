from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('blank', views.blank, name='blank'),
    path('charts', views.charts, name='charts'),
    path('forgot', views.forgot, name='forgot'),
    path('login', views.login, name='login'),
    path('register', views.register, name='register'),
    path('tables', views.tables, name='tables'),
    path('notfound', views.notfound, name='notfound'),

]