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
    path('/password/reset_sent/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('/password/reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('/password/reset_complete/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
    path('order', views.order, name='order'),
    path('order_create', views.order_create, name='order_create'),
    path('driver_cars/<int:pk>', views.driver_cars, name='driver_cars'),
    path('profile/<int:pk>', views.profile, name='profile'),
    # path('profile/<int:user_pk>', views.view_user_profile, name='user_profile'),
    path('profile_edit', views.update_profile, name='update_profile'),
    path('job_application', views.job_application, name='job_application'),
    path('driver', views.myorders, name='myorders'),
    path('ordered', views.ordered, name='ordered'),
    path('report', views.report, name='report'),
    path('licenses', views.licenses, name='licenses'),
    path('order_table', views.order_table, name='order_table'),

    path('order/<int:pk>/detail', views.order_detail, name='order_detail'),
    path('order/<int:pk>/dispatcher_select', views.order_dispatchers, name='order_dispatchers'),
    path('order/<int:pk>/order_dispatcher_select/<str:dispatcher_pk>', views.order_dispatcher_select, name='order_dispatcher_select'),
    path('order/<int:pk>/driver_select', views.order_drivers, name='order_drivers'),
    path('order/<int:pk>/order_driver_select/<str:driver_pk>', views.order_driver_select, name='order_driver_select'),
    path('order/<int:pk>/complete', views.order_complete, name='order_complete'),
    path('order/<int:pk>/delete', views.order_delete, name='order_delete'),
    path('order/<int:pk>/order_enable', views.order_enable, name='order_enable'),
    path('order/<int:pk>/order_disable', views.order_disable, name='order_disable'),
    path('order/<int:pk>/edit', views.order_edit, name='order_edit'),

    path('review_create', views.review_create, name='review_create'),
    path('orders_export', views.orders_export, name='orders_export'),
    path('<slug:slug>/',views.snippet_detail),
    path('about', views.about, name='about'),

    path('company/<int:pk>', views.company, name='company'),
    path('company_create', views.company_create, name='company_create'),
    path('company/<int:pk>/edit', views.company_edit, name='company_edit'),

    path('company_order/<int:pk>/detail', views.company_order_detail, name='company_order_detail'),
    path('company_order/<int:pk>/order_driver_select/<str:driver_pk>', views.company_order_driver_select, name='company_order_driver_select'),
    path('company_order/<int:pk>/delete', views.company_order_delete, name='company_order_delete'),
    path('company_order/<int:pk>/edit', views.company_order_edit, name='company_order_edit'),

    path('yandex_66b5cc356c187df1.html', views.yandex_66b5cc356c187df1, name='yandex_66b5cc356c187df1'),
]
