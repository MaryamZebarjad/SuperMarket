# Generated by Django 5.0.6 on 2024-09-23 14:38

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0019_delete_favorite'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderState',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('order_state_title', models.CharField(max_length=50, verbose_name='وضعیت سفارش')),
            ],
            options={
                'verbose_name': 'وضعیت سفارش',
                'verbose_name_plural': 'انواع وضعیت های سفارش',
            },
        ),
        migrations.AddField(
            model_name='order',
            name='order_state',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='orders_states', to='orders.orderstate', verbose_name='وضعیت سفارش'),
        ),
    ]
