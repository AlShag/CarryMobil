from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils import timezone
from core.models import Company
# Create your models here.


class DriverProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    passport_series = models.CharField('Серия паспорта', max_length=4)
    passport_number = models.CharField('Номер паспорта', max_length=6)
    driver_licenses_series = models.CharField('Серия водительского удостоверения', max_length=4)
    driver_licenses_number = models.CharField('Номер водительского удостоверения', max_length=6)
    registration_address = models.CharField('Адрес прописки', max_length=250)
    current_orders = models.IntegerField('Текущие заказы', blank=True, default=0)
    complited_orders = models.IntegerField('Завершенные заказы', blank=True, default=0)
    canceled_orders = models.IntegerField('Отмененные заказы', blank=True, default=0)
    driver_rating = models.IntegerField('Рейтинг водителя', blank=True, default=0)
    telephone_number = models.CharField('Номер телефона', max_length=20, blank=True, default=0)

    def __str__(self):
        return self.user.username 

    class Meta:
        app_label = "order"


class DispatcherProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    passport_series = models.IntegerField('Серия паспорта')
    passport_number = models.IntegerField('Номер паспорта')
    registration_address = models.CharField('Адрес прописки', max_length=250)
    complited_orders = models.IntegerField('Завершенные заказы', blank=True)
    canceled_orders = models.IntegerField('Отмененные заказы', blank=True)
    dispatcher_rating = models.IntegerField('Рейтинг Диспетчера', blank=True, default=0)

    def __str__(self):
        return self.user.username 
    
    class Meta:  
        app_label = "order"



class Car(models.Model):
    name = models.CharField('Марка', max_length=50)
    car_model = models.CharField('Модель', max_length=50, blank=True, null=True)
    type = models.CharField('Тип', max_length=50)
    registration_number = models.CharField('Регистрационный номер', max_length=9)
    length = models.CharField('Длина', max_length=4)
    height = models.CharField('Высота', max_length=4, blank=True, null=True)
    width = models.CharField('Ширина', max_length=4, blank=True, null=True)
    volume = models.CharField('Объём', max_length=4, blank=True, null=True)
    tonnage = models.CharField('Тоннаж', max_length=4)
    owner = models.ForeignKey(DriverProfile, on_delete=models.CASCADE)

    def __str__(self):
        return self.registration_number + ' - ' + self.name + ' ' + self.car_model


class Order(models.Model):
    full_road = models.CharField('Маршрут', max_length=1500)
    start_time = models.DateTimeField('Время прибытия на заказ', null=True, blank=True)
    road_comment = models.TextField('Комментарий к доргоге', null=True, blank=True)
    cargo_type = models.CharField('Тип груза', max_length=60, blank=True)
    cargo_type_comment = models.TextField('Тип груза комментарий', null=True, blank=True)
    loader_count = models.IntegerField('Количество грузчиков', null=True, blank=True)
    loader_time_count = models.IntegerField('Количество часов для грузчиков', null=True, blank=True)
    order_price = models.IntegerField('Стоимость заказа')
    prices = models.CharField('Цены заказа', null=True, blank=True, max_length=150)
    user_tel_nomer = models.CharField('Номер телефона заказчика', max_length=20)
    sended_in = models.DateTimeField('Время отправки заявки', null=True, blank=True)
    status = models.IntegerField('Состояние заказа', null=True, blank=True, default=0)
    identificator = models.CharField('Идентификатор заказа', max_length=20, null=True, blank=True)

    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='author',
        verbose_name='author',
        null=True,
        blank=True
    )
    dispatcher = models.ForeignKey(
        DispatcherProfile,
        on_delete=models.CASCADE,
        related_name='dispatcher',
        verbose_name='dispatcher',
        null=True,
        blank=True
    )
    driver = models.ForeignKey(
        DriverProfile,
        on_delete=models.CASCADE,
        related_name='driver',
        verbose_name='driver',
        null=True,
        blank=True
    )
    
    def __str__(self):
        return self.full_road

    class Meta:
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'


class ComplitedOrder(models.Model):
    full_road = models.CharField('Маршрут', max_length=1500)
    start_time = models.DateTimeField('Время прибытия на заказ', null=True, blank=True)
    road_comment = models.TextField('Комментарий к доргоге', null=True, blank=True)
    cargo_type = models.CharField('Тип груза', max_length=60, blank=True)
    cargo_type_comment = models.TextField('Тип груза комментарий', null=True, blank=True)
    loader_count = models.IntegerField('Количество грузчиков', null=True, blank=True)
    loader_time_count = models.IntegerField('Количество часов для грузчиков', null=True, blank=True)
    order_price = models.IntegerField('Стоимость заказа')
    prices = models.CharField('Цены заказа', null=True, blank=True, max_length=150)
    user_tel_nomer = models.CharField('Номер телефона заказчика', max_length=20)
    sended_in = models.DateTimeField('Время отправки заявки', null=True, blank=True)
    status = models.IntegerField('Состояние заказа', null=True, blank=True, default=0)
    author = models.IntegerField('ID Автора', null=True, blank=True, default=0)

    def __str__(self):
        return self.full_road

    class Meta:
        verbose_name = 'Завершенный заказ'
        verbose_name_plural = 'Завершенные заказы'


class Address(models.Model):
    address = models.CharField('Адрес', max_length=150,blank=True)

    def __str__(self):
        return self.address

    class Meta:
        verbose_name = 'Адрес'
        verbose_name_plural = 'Адреса'


class CityPrice(models.Model):
    city_1 = models.CharField('Город 1', max_length=150)
    city_2 = models.CharField('Город 2', max_length=150)
    distance = models.IntegerField('Расстояние')
    price_1_5t = models.IntegerField('Стоимость до 1.5 тонн')
    price_3t = models.IntegerField('Стоимость до 3 тонн')
    price_5t = models.IntegerField('Стоимость до 5 тонн')

    def __str__(self):
        return self.city_1 + ' - ' + self.city_2


class CargoType(models.Model):
    cargo = models.CharField('Вид груза', max_length=50)
    cargo_class = models.CharField('Класс', max_length=50, null=True,blank=True)
    price = models.IntegerField('Стоимость')

    def __str__(self):
        return self.cargo

    class Meta:
        verbose_name = 'Вид груза'
        verbose_name_plural = 'Виды грузов'


class TelOrder(models.Model):
    user_name = models.CharField('Имя заказчика', max_length=255, null=True, blank=True)
    user_tel_number = models.CharField('Номер телефона', max_length=20)
    sended_in = models.DateTimeField('Время отправки заявки', null=True, blank=True)
    author = models.IntegerField('ID Автора', null=True, blank=True, default=0)


class XeroConnectionData(models.Model):
    access_token = models.TextField(blank=True, null=True)
    refresh_token = models.CharField(max_length=200, blank=True, null=True)
    client_id = models.CharField(max_length=200, blank=True, null=True)
    client_secret = models.CharField(max_length=200, blank=True, null=True)
    tenant_id = models.CharField(max_length=200, blank=True, null=True)


class CompanyOrder(Order):
    schedule = models.CharField('Расписание грузоперевозок', max_length=64)

    company = models.ForeignKey(
        Company,
        on_delete=models.CASCADE,
        related_name='company_regular_order',
    )