from django.contrib import admin
from .models import Order
from .models import Address
from .models import CityPrice
from .models import CargoType
from .models import Review, Report


admin.site.register(Order)
admin.site.register(Address)
admin.site.register(CityPrice)
admin.site.register(CargoType)
admin.site.register(Review)
admin.site.register(Report)
# Register your models here.
