from django.utils import timezone
from django.shortcuts import render, redirect, get_object_or_404, reverse
from django.contrib import auth
from django.http import HttpResponseRedirect
from .models import Order, Address, CityPrice, CargoType
from .forms import OrderForm, AddressForm, SignInForm, SignUpForm
from django.urls import reverse_lazy
from django.contrib.auth.forms import UserCreationForm
from django.views import generic


def index(request):
    return render(request, 'main/landing.html', {})


def sign_in(request):
    form = SignInForm
    return render(request, 'accounts/login.html', {'form': form})


class SignUp(generic.CreateView):
    form_class = SignUpForm
    success_url = reverse_lazy('login')
    template_name = 'registration/register.html'


def order(request):
    error = ''
    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ordered')
        else:
            error = 'Форма была неверной'

    all_address = Address.objects.all()
    all_cityprice = CityPrice.objects.all()
    all_types = CargoType.objects.all()
    form = OrderForm()
    form.use_required_attribute = False

    data = {
        'form': form,
        'error': error,
        'all_address': all_address,
        'all_cityprice': all_cityprice,
        'all_types': all_types,
    }
    return render(request, 'order/order.html', data)


def profile(request):
    return render(request, 'user/profile.html', {})


def ordered(request):
    return render(request, 'order/ordered.html')


def myorders(request):
    orders = Order.objects.all()
    return render(request, 'driver/driver_profile.html', {'orders': orders})


def order_detail(request, pk):
    order = get_object_or_404(Order, pk=pk)
    return render(request, 'order/order_detail.html', {'order': order})


def order_table(request):
    orders = Order.objects.all()
    return render(request, 'order/order_table.html', {'orders': orders})


def order_edit(request, pk):
    order = get_object_or_404(Order, pk=request.user.pk)
    if request.method == "POST":
        form = OrderForm(request.POST, request.FILES or None, instance=order)
        if form.is_valid():
            order = form.save(commit=False)
            order.save()
            return redirect('order_detail', pk=order.pk)
    else:
        form = OrderForm(instance=order)
    redirect_url = reverse(order_table)
    return redirect(redirect_url)


class OrderEdit(generic.UpdateView):
    form_class = OrderForm
    success_url = reverse_lazy('order_table')
    template_name = 'order/order_edit.html'


def order_delete(request, pk):
    try:
        order = get_object_or_404(Order, pk=pk)
        order.delete()
        redirect_url = reverse(order_table)
        return redirect(redirect_url)

    except ValueError:
        return render(request, 'order/order_table.html')
