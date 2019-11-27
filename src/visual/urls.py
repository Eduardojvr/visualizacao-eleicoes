from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('teste.html', views.teste, name='teste'),

]