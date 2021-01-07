from django.shortcuts import render
from django.contrib import auth
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy
from django.contrib.auth.forms import UserCreationForm
from django.views import generic


def index(request):
    return render(request, 'main/landing.html', {})


def sign_in(request):
    return render(request, 'accounts/login.html', {})


class SignUpView(generic.CreateView):
    form_class = UserCreationForm
    success_url = reverse_lazy('login')
    template_name = 'registration/register.html'


def order(request):
    return render(request, 'main/order.html')
