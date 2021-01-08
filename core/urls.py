from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('sign_up', views.sign_up, name="register"),
    path('order', views.order, name='order'),
    path('driver', views.Myorders, name='Myorders'),
]
