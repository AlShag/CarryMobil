from django.urls import path, include
from django.conf.urls import url
from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('profile/<int:pk>', views.profile, name='profile'),
    # path('profile/<int:user_pk>', views.view_user_profile, name='user_profile'),
    path('profile_edit', views.update_profile, name='update_profile'),
    path('job_application', views.job_application, name='job_application'),
    path('report', views.report, name='report'),
    path('licenses', views.licenses, name='licenses'),
    path('review_create', views.review_create, name='review_create'),
    path('<slug:slug>/',views.snippet_detail),
    path('about', views.about, name='about'),
    path('yandex_66b5cc356c187df1.html', views.yandex_66b5cc356c187df1, name='yandex_66b5cc356c187df1'),

    #company
    path('company/<int:pk>', views.company, name='company'),
    path('company_create', views.company_create, name='company_create'),
    path('company/<int:pk>/edit', views.company_edit, name='company_edit'),

    path('company_order/<int:pk>/detail', views.company_order_detail, name='company_order_detail'),
    path('company_order/<int:pk>/order_driver_select/<str:driver_pk>', views.company_order_driver_select, name='company_order_driver_select'),
    path('company_order/<int:pk>/delete', views.company_order_delete, name='company_order_delete'),
    path('company_order/<int:pk>/edit', views.company_order_edit, name='company_order_edit'),

]
