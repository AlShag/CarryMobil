from django.urls import path, include
from django.conf.urls import url
from . import views
from apps import order
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
from openpyxl import Workbook

from .forms import *
from .models import *
import random
import string


urlpatterns = [
    path('order', views.order, name='order'),
    path('driver', views.myorders, name='myorders'),
    path('orders_export', views.orders_export, name='orders_export'),
    path('ordered/<int:pk>', views.ordered, name='ordered'),
    path('tel_ordered', views.tel_ordered, name='ordered_tel'),
    path('order_table', views.order_table, name='order_table'),
    path('order/<str:identificator>', views.order_view, name='order_view'),
    path('order_create', views.order_create, name='order_create'),
    path('driver_cars/<int:pk>', views.driver_cars, name='driver_cars'),
    path('order/<int:pk>/detail', views.order_detail, name='order_detail'),
    path('order_table/order_search', views.order_for_dispatcher, name='order_for_dispatcher'),
    path('order/<int:pk>/dispatcher_select', views.order_dispatchers, name='order_dispatchers'),
    path('order/<int:pk>/order_dispatcher_select/<str:dispatcher_pk>', views.order_dispatcher_select, name='order_dispatcher_select'),
    path('order/<int:pk>/driver_select', views.order_drivers, name='order_drivers'),
    path('order/<int:pk>/order_driver_select/<str:driver_pk>', views.order_driver_select, name='order_driver_select'),
    path('order/<int:pk>/order_cancel', views.order_cancel, name='order_cancel'),
    path('order/<int:pk>/order_refresh', views.order_refresh, name='order_refresh'),
    path('order/<int:pk>/complete', views.order_complete, name='order_complete'),
    path('order/<int:pk>/delete', views.order_delete, name='order_delete'),
    path('order/<int:pk>/order_enable', views.order_enable, name='order_enable'),
    path('order/<int:pk>/order_disable', views.order_disable, name='order_disable'),
    path('order/<int:pk>/edit', views.order_edit, name='order_edit'),
]