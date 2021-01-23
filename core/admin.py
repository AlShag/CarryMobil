from django.contrib import admin
from .models import Order
from .models import Address
from .models import CityPrice
from .models import CargoType


admin.site.register(Order)
admin.site.register(Address)
admin.site.register(CityPrice)
admin.site.register(CargoType)
# Register your models here.
