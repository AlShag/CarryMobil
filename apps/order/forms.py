from .models import *
from django import forms
from django.forms import ModelForm, TextInput, DateTimeInput, Textarea, NumberInput




class OrderForm(ModelForm):
    class Meta:
        model = Order
        fields = ['full_road', 'start_time', 'road_comment', 'cargo_type', 'cargo_type_comment', 'loader_count',
                  'loader_time_count', 'prices', 'order_price', 'user_tel_nomer', 'sended_in', 'status', 'author',
                  'dispatcher', 'driver']
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
        }


class OrderEditForm(ModelForm):
    class Meta:
        model = Order
        fields = ['full_road', 'start_time', 'cargo_type', 'loader_count', 'loader_time_count', 'prices', 'order_price',
                  'user_tel_nomer', 'status', 'driver']

        widgets = {
            'start_time': DateTimeInput(attrs={
                'type': 'datetime-local',
            }),
        }

class AddressForm(ModelForm):
    class Meta:
        model = Address
        fields = ['address']

        widgets = {
            'address': TextInput(attrs={
                'placeholder': 'улица, дом, населенный пункт отправки груза...',
                'required': '',
                'type': 'search',
            }),
        }


class TelOrderForm(ModelForm):
    class Meta:
        model = TelOrder
        fields = ('user_name', 'user_tel_number', 'sended_in', 'author')

        widgets = {
            'user_tel_number': NumberInput(attrs={
                'placeholder': 'Ваш номер телефона',
                'id': 'user_telephone',
                'required': '',
                'type': 'tel',
            }),
            'user_name': NumberInput(attrs={
                'placeholder': 'Как к вам обращаться?',
                'id': 'user_name',
                'type': 'text',
            }),
        }

