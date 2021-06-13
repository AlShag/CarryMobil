from django.contrib import admin
from .models import Order
from .models import Address
from .models import CityPrice
from .models import CargoType
from .models import Review, Report, TelOrder, DriverProfile, JobApplication, Car, DispatcherProfile, AssistantLibrary, Profile
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User


admin.site.register(Order)
admin.site.register(Address)
admin.site.register(CityPrice)
admin.site.register(CargoType)
admin.site.register(Review)
admin.site.register(Report)
admin.site.register(TelOrder)
admin.site.register(Profile)
admin.site.register(DriverProfile)
admin.site.register(DispatcherProfile)
admin.site.register(JobApplication)
admin.site.register(Car)
admin.site.register(AssistantLibrary)
 
# Register your models here.