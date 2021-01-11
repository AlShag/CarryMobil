from django.db import models

# Create your models here.
class Orders(models.Model):
    from_adress = models.CharField('Откуда', max_length=150)
    to_adress = models.CharField('Куда', max_length=150)
    start_time = models.DateTimeField('Время прибытия на заказ',null=True,blank=True)
    road_comment = models.TextField('Комментарий к доргоге',null=True,blank=True)
    gruz_type = models.CharField('Тип груза',max_length=50,blank=True)
    gruz_type_comment = models.TextField('Тип груза комментарий',null=True,blank=True)
    loader_count = models.IntegerField('Количество грузчиков',max_length=2,null=True,blank=True)
    loader_time_count = models.IntegerField('Количество часов для грузчиков',max_length=2,null=True,blank=True)
    user_tel_nomer = models.CharField('Номер телефона заказчика', max_length=20)

    def __str__(self):
        return self.from_adress

    class Meta:
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'

class Adresses(models.Model):
    adress=models.CharField('Адрес', max_length=150,blank=True)

    def __str__(self):
        return self.adress