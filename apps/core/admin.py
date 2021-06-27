from django.contrib import admin
from .models import *
import requests
import datetime
import json


admin.site.register(Review)
admin.site.register(Report)
admin.site.register(Profile)
admin.site.register(JobApplication)
admin.site.register(AssistantLibrary)
admin.site.register(Company)

# Register your models here.