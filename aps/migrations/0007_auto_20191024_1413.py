# Generated by Django 2.1.13 on 2019-10-24 07:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aps', '0006_auto_20191024_1319'),
    ]

    operations = [
        migrations.AlterField(
            model_name='masterkey',
            name='id',
            field=models.CharField(max_length=200),
        ),
    ]
