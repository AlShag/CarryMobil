from django.contrib import admin
from .models import Orders
from .models import Adresses
from .models import CityPrice
from .models import CargoType


admin.site.register(Orders)
admin.site.register(Adresses)
admin.site.register(CityPrice)
admin.site.register(CargoType)
# Register your models here.
