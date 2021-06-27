from django import forms
from django.forms import ModelForm, TextInput, DateTimeInput, Textarea, NumberInput, PasswordInput
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm


class SignupForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super(SignupForm, self).__init__(*args, **kwargs)
        del self.fields["username"]


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')


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
