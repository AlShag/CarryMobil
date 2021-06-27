from apps import core
from django.dispatch import dispatcher
from django.utils import timezone
from datetime import datetime

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404, reverse
from django.urls import reverse_lazy
from django.views import generic

from order.models import *
from order.forms import *
from order.views  import *
from users.forms import *
from .forms import *
from .models import *
from .models import Snippet
import random
import string



def index(request):
    reviews = Review.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'main/landing.html', {'reviews': reviews})


# ПОЛЬЗОВАТЕЛЬСКИЕ ФУНКЦИИ
    
def profile(request, pk):
    user = User.objects.get(pk=pk)
    cars = []
    its_driver = 0
    profile = get_object_or_404(User, pk=pk)
    orders = Order.objects.filter(author=user)
    data = {
        'orders': orders,
        'profile': profile,
        'user': user,
        'its_driver': its_driver,
    }
    if DriverProfile.objects.filter(user=user):
        its_driver = 1
        driver = DriverProfile.objects.get(user=user)
        cars = Car.objects.filter(owner=driver)
        if driver.driver_rating > 100:
            driver_lvl = 'Бронза'
        else:
            driver_lvl = 'Новичок'
        data.update({'driver': driver})
        data.update({'cars': cars})
        data.update({'driver_lvl': driver_lvl})
    else:
        its_driver = 0
    if request.user.is_superuser:
        users_list = User.objects.all()
        data.update({'users_list': users_list})
        if Order.objects.filter(status=0):
            messages.info(request,'Внимание в базе данных есть не обработанные заказы')
            
    return render(request, 'user/profile.html', data)


@login_required
def view_user_profile(request, user_pk):
    user = User.objects.get(pk=user_pk)
    return render(request, 'profile.html')


def job_application(request):
    application_form = JobApplicationForm(request.POST)
    application_form.user = request.user
    if request.method == 'POST':
        if application_form.is_valid():
            application = application_form.save(commit=False)
            application.save()
            return redirect(index)
        else:
            messages.error(request, 'Пожалуйста, исправьте ошибки.')
            return redirect(job_application)
    else:
        application_form = JobApplicationForm
    return render(request, 'user/job_application.html', {
        'application_form': application_form
    })


@login_required
@transaction.atomic
def update_profile(request):
    if request.method == 'POST':
        user_form = UserForm(request.POST, instance=request.user)
        profile_form = ProfileForm(request.POST, instance=request.user.profile)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            return render(request, 'user/profile.html')
        else:
            messages.error(request, 'Пожалуйста, исправьте ошибки.')
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.profile)
    return render(request, 'user/profile_edit.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })


def report(request):
    report = ReportForm(request.POST)
    if request.method == 'POST':
        if report.is_valid():
            report.save()
            return redirect('index')
        else:
            error = 'Форма была неверной'
    return render(request, 'help/report.html', {'report': report})


# ОТЗЫВЫ
@login_required
def review_create(request):
    if request.method == 'POST':
        review_form = ReviewForm(request.POST)
        if review_form.is_valid():
            review = review_form.save(commit=False)
            review.author = request.user
            review.published_date = timezone.now()
            review.save()
            return redirect(index)
        else:
            return redirect(review_create)
    else:
        review_form = ReviewForm
    return render(request, 'main/review.html', {
        'review_form': review_form
    })


def index(request):
    if request.method == 'POST':
        review_form = ReviewForm(request.POST)
        telorder = TelOrderForm(request.POST)
        if telorder.is_valid():
            telorder.save()
            return tel_ordered(request)
        else:
            if review_form.is_valid():
                review = review_form.save(commit=False)
                review.author = request.user
                review.published_date = timezone.now()
                review.save()
                return redirect(index)
            else:
                return redirect(index)
    else:
        review_form = ReviewForm
        telorder = TelOrderForm

    reviews = Review.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'main/landing.html', {'reviews': reviews, 'review_form': review_form, 'telorder': telorder})


def licenses(request):
    return render(request, 'licenses/licenses.html', {})
  
  
def about(request):
    return render(request, 'main/about.html', {})


def yandex_66b5cc356c187df1(request):
    return render(request, 'main/yandex_66b5cc356c187df1.html', {})


def snippet_detail(request, slug):
    snippet = get_object_or_404(Snippet, slug=slug)
    return HttpResponse(f'This should be the detail view for the slug of {slug}')


def company(request, pk):
    company = Company.objects.get(pk=pk)
    company_orders = CompanyOrder.objects.filter(
        company=company
    )
    return render(request, 'company/company_profile.html', {
        'company_orders': company_orders,
        })


def company_create(request):
    form = CompanyForm(request.POST)
    form.contact_user = request.user
    if request.method == 'POST':
        form = CompanyForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'company/company_profile.html', {'pk': form.pk})
    form=CompanyForm()
    return render(request, 'company/company_create.html', {'form': form})
    


def company_edit(request, pk):
    company = get_object_or_404(Company, pk=pk)
    if request.method == 'POST':
        form = CompanyForm(request.POST, instance=company)
        if form.is_valid():
            form.save()
            return render(request, 'company/company_profile.html', {'pk': company.pk})


def company_order_driver_select(request, pk, driver_pk):
    order = get_object_or_404(CompanyOrder, pk=pk)
    order.driver = DriverProfile.objects.get(pk=driver_pk)
    order.save()
    return order_detail(request, pk)


def company_order_detail(request, pk):
    permission = False
    order_object = get_object_or_404(CompanyOrder, pk=pk)
    if request.user.is_superuser:
        permission = True
    if order_object.driver:
        if order_object.driver.user == request.user:
            permission = True
    if order_object.company.contact_user == request.user:
        permission = True
    if DispatcherProfile.objects.filter(user=request.user):
        permission = True
    return render(request, 'company_order/company_order_detail.html', {'order': order_object, 'permission': permission})


def company_order_create(request):
    if request.method == 'POST':
        form = CompanyOrderForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ordered')



def company_order_edit(request, pk):
    company_order = get_object_or_404(CompanyOrder, pk=pk)
    if request.method == 'POST':
        form = OrderEditForm(request.POST, instance=company_order)
        if form.is_valid():
            form.save()
            return redirect(order_detail, pk=company_order.pk)


def company_order_delete(request, pk):
    try:
        company_order = get_object_or_404(CompanyOrder, pk=pk)
        company_order.delete()
        return redirect(reverse(order_table))

    except ValueError:
        return render(request, 'company/company_profile.html')


def company_orders(request):
    orders = CompanyOrder.objects.filter(
        company__contact_user=request.user
    )
    return render(request, 'company/company_profile.html', {'orders': orders})
