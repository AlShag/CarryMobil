from .models import Order, Address, Profile, Review
from django import forms
from django.forms import ModelForm, TextInput, DateTimeInput, Textarea, NumberInput, PasswordInput
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm


# class UserRegisterForm(UserCreationForm):
#   email = forms.EmailField()

#   class Meta:
#       model = User
#       fields = ['username', 'email', 'first_name']

#       widgets = {
#           'username': TextInput(attrs={
#               'placeholder':'Придумайте логин для авторизации',
#           }),
#       }


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')


class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('birth_date', 'location', 'company')


class SignInForm(AuthenticationForm):
    class Meta:
        username = forms.CharField(widget=TextInput(attrs={'class':'validate','placeholder': 'Email'}))
        password = forms.CharField(widget=PasswordInput(attrs={'placeholder':'Password'}))


class SignUpForm(UserCreationForm):
    class Meta:
        model = User
        fields = ('username','password1','password2',)
        widgets = {
            'username': forms.TextInput(attrs={
                        'class':'form-control',
                        'placeholder':'Придумайте свой логин',
                }),
            'password1': forms.TextInput(attrs={
                        'class':'form-control',
                        'placeholder':'Придумайте пароль',
                }),
            'password2': forms.TextInput(attrs={
                        'class':'form-control',
                        'placeholder':'Повторите пароль',
                }),
        }


class OrderForm(ModelForm):
    class Meta:
        model = Order
        fields = ['from_address','to_address','start_time','road_comment','cargo_type','cargo_type_comment','loader_count','loader_time_count','order_price','user_tel_nomer','status']

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
                'id': 'user_telephone',
                'required':'',
                'type': 'telephone',
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
        fields = ['text']
