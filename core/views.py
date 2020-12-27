from django.shortcuts import render
from django.contrib import auth
from django.http import HttpResponseRedirect


def index(request):
    return render(request, 'main/landing.html', {})


def sign_in(request):
    return render(request, 'accounts/login.html', {})


def sign_up(request):
    return render(request, 'accounts/register.html')
