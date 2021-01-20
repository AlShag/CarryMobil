from django.urls import path
from . import views
from .views import SignUpView
from django.contrib import admin


urlpatterns = [
    path('admin', admin.site.urls),
    path('', views.index, name='index'),
    path('register', SignUpView.as_view(), name='register'),
    path('order', views.order, name='order'),
    path('profile', views.profile, name='profile'),
    path('driver', views.Myorders, name='Myorders'),
    path('ordered', views.ordered, name='ordered'),
    path('order_table', views.order_table, name='order_table'),
    path('order_delete', views.order_delete, name='order_delete'),
]
