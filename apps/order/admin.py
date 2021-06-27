from django.contrib import admin
from .models import *
import requests
import datetime
import json


@admin.register(XeroConnectionData)
class XeroConnectionDataAdmin(admin.ModelAdmin):
    def has_add_permission(self, request):
        if self.model.objects.count() >= 1:
            return False
        return super().has_add_permission(request)


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_filter = ('status', )
    actions = ['send_to_xero', ]

    def send_to_xero(self, request, queryset):
        access_token = get_access_token()
        get_invoices_headers = {
            "xero-tenant-id": "86c8414c-60bf-410c-a2db-7e7165195a1c",
            "Authorization": f"Bearer {access_token}",
            "Accept": "application/json",
            "Content-Type": "application/json",
        }
        for order in queryset:
            post_invoice_body = {
                "Invoices": [{
                    "Type": "ACCREC",
                    "Contact": {"Name": "Customer"},
                    "LineItems": [{
                        "Description": "200",
                        "Quantity": "1",
                        "UnitAmount": order.order_price,
                        "AccountCode": "200",
                        "TaxType": "NONE"
                    }],
                    "Date": order.start_time.strftime('%m/%d/%Y'),
                    "DueDate": order.start_time.strftime('%m/%d/%Y'),
                    "InvoiceNumber": f"INV{order.id}"}
                ]}
            post_invoice = requests.post("https://api.xero.com/api.xro/2.0/Invoices", json.dumps(post_invoice_body), headers=get_invoices_headers)
            # post_invoice = requests.get("https://api.xero.com/api.xro/2.0/Invoices", headers=get_invoices_headers)
            print(post_invoice.status_code)
            if post_invoice.status_code == 200:
                print("TRUE")
                order.status = "5"
                order.save()


def get_access_token():
    xero_connection_data = XeroConnectionData.objects.first()
    get_access_token_body = {
        "grant_type": "refresh_token",
        "refresh_token": xero_connection_data.refresh_token,
        "client_id": "9F3D216533EA40888EC4F178008389DB",
        "client_secret": "V32ohQtP_G9uukX-cI1oPcimn14gr5k3g4x-tsMYRFwFCy7a"
    }
    get_access_token = requests.post("https://identity.xero.com/connect/token", get_access_token_body)
    get_access_token_json = get_access_token.json()
    xero_connection_data = XeroConnectionData.objects.first()
    xero_connection_data.access_token = get_access_token_json.get("access_token")
    print(get_access_token_json)
    xero_connection_data.refresh_token = get_access_token_json.get("refresh_token")
    xero_connection_data.save()
    return get_access_token_json.get("access_token")


admin.site.register(Address)
admin.site.register(CityPrice)
admin.site.register(CargoType)
admin.site.register(TelOrder)
admin.site.register(DriverProfile)
admin.site.register(DispatcherProfile)
admin.site.register(Car)

# Register your models here.