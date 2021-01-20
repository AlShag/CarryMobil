from django.utils import timezone
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import auth
from django.http import HttpResponseRedirect
from .models import Orders
from .models import Adresses
from .models import CityPrice
from .models import CargoType
from .forms import OrdersForm
from .forms import AdressesForm
from .forms import SignInForm
from .forms import SignUpForm
from django.urls import reverse_lazy
from django.contrib.auth.forms import UserCreationForm
from django.views import generic


def index(request):
    return render(request, 'main/landing.html', {})


def sign_in(request):
    form = SignInForm
    return render(request, 'accounts/login.html', {'form': form})


class SignUpView(generic.CreateView):
    form_class = SignUpForm
    success_url = reverse_lazy('login')
    template_name = 'registration/register.html'


def order(request):
    error = ''
    if request.method == 'POST':
        form = OrdersForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ordered')
        else:
            error = 'Форма была неверной'

    all_adress = Adresses.objects.all()
    all_cityprice = CityPrice.objects.all()
    all_types = CargoType.objects.all()
    form = OrdersForm()
    form.use_required_attribute = False

    data = {
        'form': form,
        'error': error,
        'all_adress': all_adress,
        'all_cityprice': all_cityprice,
        'all_types': all_types,
    }
    return render(request, 'order/order.html', data)


def profile(request):
    return render(request, 'user/profile.html', {})


def Myorders(request):
    all_orders = Orders.objects.all()
    return render(request, 'driver/driver_profile.html', {'all_orders': all_orders})


def ordered(request):
    return render(request, 'order/ordered.html')


def order_table(request):
    orders = Orders.objects.all()
    return render(request, 'order/order_table.html', {'orders': orders})


def order_delete(request, pk):
    try:
        order = get_object_or_404(Orders, pk=pk)
        order.delete()
        orders = Orders.objects.filter(date__lte=timezone.now()).order_by('date')
        return render(request, 'order/order_table.html', {'orders': orders})

    except ValueError:
        return render(request, 'order/order_table.html')
