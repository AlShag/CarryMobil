from django.forms.models import ModelForm
from django.utils import timezone
from django.shortcuts import render, redirect, get_object_or_404, reverse
from django.contrib import auth
from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse_lazy
from django.views import generic
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages, auth
from django.db import transaction
from datetime import timedelta, datetime
from openpyxl import Workbook
from django.contrib import messages
from . import forms
from django.views.generic import FormView
from django.contrib.auth.views import logout_then_login
import account.forms
import account.views



class LoginView(account.views.LoginView):
    form_class = account.forms.LoginEmailForm

class SignupView(ModelForm):
    form_class =  forms.SignupForm



def sign_in(request):
    form = forms.SignInForm
    return render(request, 'account/login.html', {'form': form})


class SignUp(generic.CreateView):
    form_class = forms.SignUpForm
    success_url = reverse_lazy('login')
    template_name = 'account/signup.html'

    def generate_username(self, form):
        username = form.cleaned_data["email"]
        return username


def log_out(request):
    logout_then_login(request)
    return redirect(reverse("core:home"))

def site_base(request):
    return render(request, 'base.html', {})

def password_reset(request):
    return render(request, 'password_reset.html', {})
