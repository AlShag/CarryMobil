from django.conf import settings
from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils import timezone
from django.utils.text import slugify


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    patronymic = models.CharField(max_length=50, blank=True)
    company = models.CharField(max_length=40, blank=True)
    location = models.CharField(max_length=30, blank=True)
    birth_date = models.DateField(null=True, blank=True)
    telephone_number = models.CharField('Номер телефона', max_length=20)

    def __str__(self):
        return self.user.username

    class Meta:
        app_label = "core"


class JobApplication(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    job_type = models.CharField('Вид деятельности', max_length=50)
    passport_series = models.CharField('Серия паспорта', max_length=4)
    passport_number = models.CharField('Номер паспорта', max_length=6)
    registration_address = models.CharField('Адресс прописки', max_length=250)
    driver_licenses_series = models.CharField('Серия водительского удостоверения', max_length=4, blank=True)
    driver_licenses_number = models.CharField('Номер водительского удостоверения', max_length=6, blank=True)
    telephone_number = models.CharField('Номер телефона', max_length=20)

    def __str__(self):
        return self.user.username 
    

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


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


class AssistantLibrary(models.Model):
    user_answer = models.CharField('Ответ пользователя', max_length=150,blank=True)
    assistant_text = models.TextField('Текст ассистента',blank=True)
    function_id = models.IntegerField('Функция',null=True, blank=True, default=0)

    def __str__(self):
        return self.user_answer

    class Meta:
        verbose_name = 'Ответ ассистента'
        verbose_name_plural = 'Словарь ассистента'


class Company(models.Model):
    company_name = models.CharField('Имя компании', max_length=128)
    company_inn = models.CharField('ИНН компании', max_length=12)
    business_type = models.CharField('Вид деятельности', max_length=128)
    legal_address = models.CharField('Юридический адрес', max_length=128)
    actual_address = models.CharField('Фактический адрес', max_length=128)
    contact_name = models.CharField('Имя контакта', max_length=128)
    contact_phone = models.CharField('Телефон контакта', max_length=12)
    contact_email = models.EmailField('Эл.почта контакта', max_length=64)
    contact_user = models.OneToOneField(
        User,
        related_name='company',
        on_delete=models.PROTECT
    )
    status = models.BooleanField('Статус компании', default=0)

