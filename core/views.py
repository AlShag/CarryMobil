from django.shortcuts import render
from django.contrib import auth
from django.http import HttpResponseRedirect


def index(request):
    return render(request, 'main/landing.html', {})


def sign_in(request):
    return render(request, 'main/sign_in.html', {})


def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = auth.authenticate(username=username, password=password)
    if user is not None and user.is_active:
        # Правильный пароль и пользователь "активен"
        auth.login(request, user)
        # Перенаправление на "правильную" страницу
        return render(request, 'main/landing.html', {})
    else:
        # Отображение страницы с ошибкой
        return HttpResponseRedirect("/account/invalid/")


def logout(request):
    auth.logout(request)
    # Перенаправление на страницу.
    return HttpResponseRedirect("/account/loggedout/")


def sign_up(request):
    return render(request, 'main/sign_up.html', {})
