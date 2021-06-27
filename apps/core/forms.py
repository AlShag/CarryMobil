from .models import *
from django import forms
from django.forms import ModelForm, TextInput, DateTimeInput, Textarea, NumberInput, PasswordInput
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from order.models import CompanyOrder

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('patronymic', 'birth_date', 'location', 'company', 'telephone_number')



class CompanyOrderForm(ModelForm):
    class Meta:
        model = CompanyOrder
        fields = ['company', 'schedule', 'full_road', 'start_time', 'road_comment', 'cargo_type', 'cargo_type_comment',
                  'loader_count', 'loader_time_count', 'prices', 'order_price', 'user_tel_nomer', 'sended_in', 'status',
                  'author', 'dispatcher', 'driver']
        widgets = {
            'from_address': TextInput(attrs={
                'placeholder': 'Населенный пункт, улица, дом отправления груза...',
                'required': '',
            }),
            'to_address': TextInput(attrs={
                'placeholder': 'Населенный пункт, улица, дом направления груза...',
                'required': '',
            }),
            'start_time': DateTimeInput(attrs={
                'type': 'datetime-local',
            }),
            'road_comment': Textarea(attrs={
                'placeholder': 'Необязательное поле',
                'rows': '5',
            }),
            'cargo_type_comment': Textarea(attrs={
                'placeholder': 'Необязательное поле',
                'rows': '4',
            }),
            'loader_count': NumberInput(attrs={
                'placeholder': '0 чел.',
                'max': '12',
                'min': '0',
            }),
            'loader_time_count': NumberInput(attrs={
                'placeholder': '0 час.',
                'max': '8',
                'min': '0',
            }),
            'user_tel_nomer': NumberInput(attrs={
                'placeholder': 'Номер телефона',
                'id': 'user_telephone',
                'required': '',
                'type': 'telephone',
            }),
            'schedule': TextInput(attrs={
                'placeholder': 'Каждый второй четверг месяца',
                'id': 'schedule',
                'required': True,
            }),
        }


class CompanyOrderEditForm(ModelForm):
    class Meta:
        model = CompanyOrder
        fields = ['schedule', 'full_road', 'start_time', 'cargo_type', 'loader_count', 'loader_time_count', 'prices',
                  'order_price', 'user_tel_nomer', 'status', 'driver']

        widgets = {
            'start_time': DateTimeInput(attrs={
                'type': 'datetime-local',
            }),
        }


class ReviewForm(ModelForm):
    class Meta:
        model = Review
        fields = ['text', 'stars', 'likes']

        widgets = {
            'text': Textarea(attrs={
                'placeholder': 'Здесь вы можете написать свой отзыв...',
            }),
        }


class ReportForm(ModelForm):
    class Meta:
        model = Report
        fields = ['report_text', 'published_date']

        widgets = {
            'report_text': Textarea(attrs={
                'placeholder': 'Здесь вы можете описать суть проблемы с которой вы столкнулись'
            })
        }


class JobApplicationForm(ModelForm):
    class Meta:
        model = JobApplication
        fields = ['user', 'job_type', 'passport_series', 'passport_number', 'registration_address',
                  'driver_licenses_series', 'driver_licenses_number', 'telephone_number']


class AssistantLibraryForm(ModelForm):
    class Meta:
        model = AssistantLibrary
        fields = ['user_answer', 'assistant_text', 'function_id']


class CompanyForm(ModelForm):
    class Meta:
        model = Company
        fields = ['company_name', 'company_inn', 'business_type', 'legal_address', 'actual_address', 'contact_name',
                  'contact_phone', 'contact_email', 'contact_user']
