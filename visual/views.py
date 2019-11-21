from django.shortcuts import render

def index(request):
    return render(request, 'index.html')

def notfound(request):
    return render(request, '404.html')

def blank(request):
    return render(request, 'blank.html')

def forgot(request):
    return render(request, 'forgot-password.html')

def login(request):
    return render(request, 'login.html')

def register(request):
    return render(request, 'register.html')

def tables(request):
    return render(request, 'tables.html')

def charts(request):
    return render(request, 'charts.html')