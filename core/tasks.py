import datetime
import json
import logging

import requests

from CarryMobil import celery_app
from core.models import Order
from core.models import XeroConnectionData

logger = logging.getLogger(__name__)


@celery_app.task
def send_to_xero():
    access_token = get_access_token()
    get_invoices_headers = {
        "xero-tenant-id": XeroConnectionData.objects.first().tenant_id,
        "Authorization": f"Bearer {access_token}",
        "Accept": "application/json",
        "Content-Type": "application/json",
    }

    for order in Order.objects.filter(
        status=4
    ):
        post_invoice_body = {
            "Invoices": [{
                "Type": "ACCREC",
                "Contact": {"ContactID": "3010840a-e9f3-4e94-8b5d-0d646f62be03"},
                "LineItems": {
                    "Description": "200",
                    "Quantity": 1,
                    "UnitAmount": order.order_price,
                    "AccountCode": "200",
                    "TaxType": "NONE"
                },
                "Date": order.start_time,
                "DueDate": order.start_time+datetime.timedelta(days=7),
                "InvoiceNumber": order.id+"  Order Invoice"}
            ]}
        post_invoice = requests.post("https://api.xero.com/api.xro/2.0/Invoices", json.dumps(post_invoice_body),
                                     headers=get_invoices_headers)
        if post_invoice.status_code == 200:
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
    xero_connection_data.refresh_token = get_access_token_json.get("refresh_token")
    xero_connection_data.save()
    return get_access_token_json.get("access_token")
