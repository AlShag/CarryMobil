# Generated by Django 3.1.4 on 2021-01-20 07:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0021_cargotype_cargo_class'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cargotype',
            name='cargo_class',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='Класс'),
        ),
    ]