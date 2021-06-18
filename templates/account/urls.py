from django.urls import path, include
from django.conf.urls import url
from django.conf import settings
from django.contrib.auth import views as auth_views
from . import views
from .views import SignUp

urlpatterns = [
    path('account/signup/', SignUp.as_view(), name='SignUp'),
    path('base.html', views.site_base, name='site_base'),
    path('/password/reset/', auth_views.PasswordResetView.as_view(), name='password_reset'),
    
    path('/password/reset_sent/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    
    path('/password/reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),

    path('/password/reset_complete/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),

]
