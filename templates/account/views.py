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



def site_base(request):
    return render(request, 'base.html', {})


def password_change(request):
    return render(request, 'password_change.html', {})


def email_confirm(request):
    return render(request, 'email_confirm.html', {})