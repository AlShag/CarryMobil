from .models import Orders
from django.forms import ModelForm, TextInput, DateTimeInput, Textarea, NumberInput


class OrdersForm(ModelForm):
    class Meta:
        model = Orders
        fields = ['from_adress','to_adress','start_time','road_comment','gruz_type','gruz_type_comment','loader_count','loader_time_count','user_tel_nomer']

        widgets = {
            'from_adress':  TextInput(attrs={
                'placeholder': 'Населенный пункт, улица, дом отправления груза...',
                'required':'',
            }),
            'to_adress':  TextInput(attrs={
                'placeholder': 'Населенный пункт, улица, дом направления груза...',
                'required':'',
            }),
            'start_time':  DateTimeInput(attrs={
                'type': 'datetime-local',
            }),
            'road_comment':  Textarea(attrs={
                'placeholder': 'Уточнения к указанным местам',
            }),
            'user_tel_nomer':  NumberInput(attrs={
                'id': 'user_telephone',
                'required':'',
            }),
        }