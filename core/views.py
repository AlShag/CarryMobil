from django.shortcuts import render,redirect
from django.contrib import auth
from django.http import HttpResponseRedirect
from .models import Orders
from .forms import OrdersForm
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
    error = ''
    if request.method == 'POST':
        form = OrdersForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('index')
        else:
            error = 'Форма была неверной'


    form = OrdersForm()
    form.use_required_attribute=False

    data = {
        'form': form,
        'error': error
    }
    return render(request, 'order/order.html', data)


def Myorders(request):
    all_orders = Orders.objects.all()
    return render(request, 'driver/driver_profile.html', {'all_orders': all_orders})