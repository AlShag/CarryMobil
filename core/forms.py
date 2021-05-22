from .models import Order, Address, Profile, Review, Report, TelOrder, JobApplication
from django import forms
from django.forms import ModelForm, TextInput, DateTimeInput, Textarea, NumberInput, PasswordInput
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
import account.forms


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')

    
class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('patronymic','birth_date', 'location', 'company', 'telephone_number')


class SignInForm(AuthenticationForm):
    class Meta:
        username = forms.CharField(widget=TextInput(attrs={'class': 'validate', 'placeholder': 'Email'}))
        password = forms.CharField(widget=PasswordInput(attrs={'placeholder': 'Password'}))


class SignUpForm(UserCreationForm):
    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2',)
        widgets = {
            'username': forms.TextInput(attrs={
                        'class': 'form-control',
                        'placeholder': 'Придумайте свой логин',
                }),
            'email': forms.EmailInput(attrs={
                        'class': 'form-control',
                        'placeholder': 'Ваша электронная почта',
                        'required': True
                }),
            'password1': forms.TextInput(attrs={
                        'class': 'form-control',
                        'placeholder': 'Придумайте пароль',
                }),
            'password2': forms.TextInput(attrs={
                        'class': 'form-control',
                        'placeholder': 'Повторите пароль',
                }),
        }
        

class OrderForm(ModelForm):
    class Meta:
        model = Order
        fields = ['full_road','start_time','road_comment','cargo_type','cargo_type_comment','loader_count','loader_time_count','prices','order_price','user_tel_nomer','sended_in','status']

        widgets = {
            'from_address':  TextInput(attrs={
                'placeholder': 'Населенный пункт, улица, дом отправления груза...',
                'required':'',
            }),
            'to_address':  TextInput(attrs={
                'placeholder': 'Населенный пункт, улица, дом направления груза...',
                'required':'',
            }),
            'start_time':  DateTimeInput(attrs={
                'type': 'datetime-local',
            }),
            'road_comment':  Textarea(attrs={
                'placeholder': 'Необязательное поле',
                'rows': '5',
            }),
            'cargo_type_comment':  Textarea(attrs={
                'placeholder': 'Необязательное поле',
                'rows': '4',
            }),
            'loader_count':  NumberInput(attrs={
                'placeholder': '0 чел.',
                'max':'12',
                'min':'0',
            }),
            'loader_time_count':  NumberInput(attrs={
                'placeholder': '0 час.',
                'max':'8',
                'min':'0',
            }),
            'user_tel_nomer':  NumberInput(attrs={
                'placeholder': 'Номер телефона',
                'id': 'user_telephone',
                'required':'',
                'type': 'telephone',
            }),
        }


class OrderEditForm(ModelForm):
    class Meta:
        model = Order
        fields = ['full_road','start_time','cargo_type','loader_count','loader_time_count','prices','order_price','user_tel_nomer','status']

        widgets = {
            'start_time':  DateTimeInput(attrs={
                'type': 'datetime-local',
            }),
        }


class AddressForm(ModelForm):
    class Meta:
        model = Address
        fields = ['address']

        widgets = {
            'address':  TextInput(attrs={
                'placeholder': 'улица, дом, населенный пункт отправки груза...',
                'required':'',
                'type': 'search',
            }),
        }


class ReviewForm(ModelForm):
    class Meta:
        model = Review
        fields = ['text', 'stars', 'likes']

        widgets = {
            'text':  Textarea(attrs={
                'placeholder': 'Здесь вы можете написать свой отзыв...',
            }),
        }


class ReportForm(ModelForm):
    class Meta:
        model = Report
        fields = ['report_text', 'published_date']

        widgets = {
            'report_text': Textarea(attrs={
                'placeholder':'Здесь вы можете описать суть проблемы с которой вы столкнулись'
            })
        }


class TelOrderForm(ModelForm):
    class Meta:
        model = TelOrder
        fields = ('user_name','user_tel_number', 'sended_in', 'author')

        widgets = {
            'user_tel_number':  NumberInput(attrs={
                'placeholder': 'Ваш номер телефона',
                'id': 'user_telephone',
                'required':'',
                'type': 'tel',
            }),
            'user_name':  NumberInput(attrs={
                'placeholder': 'Как к вам обращаться?',
                'id': 'user_name',
                'type': 'text',
            }),
        }


class JobApplicationForm(ModelForm):
    class Meta:
        model = JobApplication
        fields = ['user', 'job_type', 'passport_series','passport_number', 'registration_address','driver_licenses_series', 'driver_licenses_number','telephone_number']
