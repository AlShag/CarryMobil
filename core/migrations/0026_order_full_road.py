# Generated by Django 3.1.4 on 2021-02-16 15:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0025_profile'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='full_road',
            field=models.CharField(default=1, max_length=300, verbose_name='Маршрут'),
            preserve_default=False,
        ),
    ]