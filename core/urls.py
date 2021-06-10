from django.urls import path, include
from django.conf.urls import url
from . import views
from .views import SignUp
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.index, name='index'),
    url(r"^account/login/$", views.LoginView.as_view(), name="login"),
    path('account/signup/', SignUp.as_view(), name='SignUp'),
    path('account/signup/', SignUp.as_view(), name='register'),
    url(r"^account/", include("account.urls")),
    path('/account/logout', auth_views.LogoutView.as_view(), name='logout'),
    path('/password/reset/', auth_views.PasswordResetView.as_view(), name='password_reset'),
    path('order', views.order, name='order'),
    path('order_create', views.order_create, name='order_create'),
    path('profile/<int:pk>', views.profile, name='profile'),
    path('profile/<int:user_pk>', views.view_user_profile, name='user_profile'),
    path('profile_edit', views.update_profile, name='update_profile'),
    path('job_application', views.job_application, name='job_application'),
    path('driver', views.myorders, name='myorders'),
    path('ordered', views.ordered, name='ordered'),
    path('report', views.report, name='report'),
    path('licenses', views.licenses, name='licenses'),
    path('order_table', views.order_table, name='order_table'),
    path('order/<int:pk>/detail', views.order_detail, name='order_detail'),
    path('order/<int:pk>/complete', views.order_complete, name='order_complete'),
    path('order/<int:pk>/delete', views.order_delete, name='order_delete'),
    path('order/<int:pk>/order_enable', views.order_enable, name='order_enable'),
    path('order/<int:pk>/edit', views.order_edit, name='order_edit'),
    path('review_create', views.review_create, name='review_create'),
    path('orders_export', views.orders_export, name='orders_export'),
    path('<slug:slug>/',views.snippet_detail),
    path('about', views.about, name='about'),
    path('yandex_66b5cc356c187df1.html', views.yandex_66b5cc356c187df1, name='yandex_66b5cc356c187df1'),
]
