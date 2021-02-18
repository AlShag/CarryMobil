from django.urls import path
from . import views
from .views import SignUp, OrderEdit
from django.contrib import admin


urlpatterns = [
    path('admin', admin.site.urls),
    path('', views.index, name='index'),
    path('register', SignUp.as_view(), name='register'),
    path('order', views.order, name='order'),
    path('profile', views.profile, name='profile'),
    path('profile_edit', views.update_profile, name='update_profile'),
    path('driver', views.myorders, name='myorders'),
    path('ordered', views.ordered, name='ordered'),
    path('licenses', views.licenses, name='licenses'),
    path('order_table', views.order_table, name='order_table'),
    path('order/<int:pk>/detail', views.order_detail, name='order_detail'),
    path('order/<int:pk>/delete', views.order_delete, name='order_delete'),
    path('order/<int:pk>/edit', OrderEdit.as_view(), name='order_edit'),
    path('review_create', views.review_create, name='review_create'),
]
