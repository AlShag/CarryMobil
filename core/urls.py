from django.urls import path
from . import views
from .views import SignUp
from django.contrib import admin


urlpatterns = [
    path('', views.index, name='index'),
    path('register', SignUp.as_view(), name='register'),
    path('order', views.order, name='order'),
    path('order_create', views.order_create, name='order_create'),
    path('profile', views.profile, name='profile'),
    path('profile_edit', views.update_profile, name='update_profile'),
    path('driver', views.myorders, name='myorders'),
    path('ordered', views.ordered, name='ordered'),
    path('report', views.report, name='report'),
    path('licenses', views.licenses, name='licenses'),
    path('order_table', views.order_table, name='order_table'),
    path('order/<int:pk>/detail', views.order_detail, name='order_detail'),
    path('order/<int:pk>/delete', views.order_delete, name='order_delete'),
    path('order/<int:pk>/order_enable', views.order_enable, name='order_enable'),
    path('order/<int:pk>/edit', views.order_edit, name='order_edit'),
    path('review_create', views.review_create, name='review_create'),
    path('<slug:slug>/',views.snippet_detail),
    path('about', views.about, name='about'),
    path('yandex_66b5cc356c187df1.html', views.yandex_66b5cc356c187df1, name='yandex_66b5cc356c187df1'),
]
