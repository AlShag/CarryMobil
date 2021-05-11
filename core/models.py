from django.db import models
from django.conf import settings
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
import datetime
from django.utils import timezone
from django.utils.text import slugify


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    company = models.CharField(max_length=40, blank=True)
    location = models.CharField(max_length=30, blank=True)
    birth_date = models.DateField(null=True, blank=True)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


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
    sended_in = models.DateTimeField('Время отправки заявки', null=True, blank=True, default=datetime.datetime.now())
    status = models.IntegerField('Состояние заказа', null=True, blank=True, default=0)
    author = models.IntegerField('ID Автора', null=True, blank=True, default=0)

    def __str__(self):
        return self.full_road

    class Meta:
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'


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


class Review(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    text = models.TextField()
    stars = models.IntegerField(null=True, blank=True, default=1)
    likes = models.IntegerField(null=True, blank=True, default=0)
    published_date = models.DateTimeField(default=timezone.now)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.text


class Report(models.Model):
    report_text = models.TextField()
    published_date = models.DateTimeField(default=timezone.now, null=True, blank=True)


class Snippet(models.Model):
    title = models.CharField(max_length=150)
    slug = models.SlugField(blank=True, null=True)
    body = models.TextField()

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return f'/{self.slug}/'


class TelOrder(models.Model):
    user_name = models.CharField('Имя заказчика', max_length=255, null=True, blank=True)
    user_tel_number = models.CharField('Номер телефона', max_length=20)
    sended_in = models.DateTimeField('Время отправки заявки', null=True, blank=True, default=datetime.datetime.now())
    author = models.IntegerField('ID Автора', null=True, blank=True, default=0)
