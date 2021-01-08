from django.urls import path
from . import views
from .views import SignUpView


urlpatterns = [
    path('', views.index, name='index'),
    path('register', SignUpView.as_view(), name='register'),
    path('order', views.order, name='order'),
    path('driver', views.Myorders, name='Myorders'),
]
