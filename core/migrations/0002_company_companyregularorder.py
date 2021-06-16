# Generated by Django 3.2 on 2021-06-14 01:57

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company_name', models.CharField(max_length=128, verbose_name='Имя компании')),
                ('company_inn', models.CharField(max_length=12, verbose_name='ИНН компании')),
                ('business_type', models.CharField(max_length=128, verbose_name='Вид деятельности')),
                ('legal_address', models.CharField(max_length=128, verbose_name='Юридический адрес')),
                ('actual_address', models.CharField(max_length=128, verbose_name='Фактический адрес')),
                ('contact_name', models.CharField(max_length=128, verbose_name='Имя контакта')),
                ('contact_phone', models.CharField(max_length=12, verbose_name='Телефон контакта')),
                ('contact_email', models.EmailField(max_length=64, verbose_name='Эл.почта контакта')),
                ('contact_user', models.OneToOneField(on_delete=django.db.models.deletion.PROTECT, related_name='company', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='CompanyRegularOrder',
            fields=[
                ('order_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='core.order')),
                ('schedule', models.CharField(max_length=64, verbose_name='Расписание грузоперевозок')),
                ('company', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='company_regular_order', to='core.company')),
            ],
            bases=('core.order',),
        ),
    ]