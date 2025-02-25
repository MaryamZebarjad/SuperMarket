# Generated by Django 5.0.6 on 2024-07-15 16:04

import django.utils.timezone
import utils
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0002_rename_group_product_productgroup_group_parent_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='brand',
            name='image_name',
            field=models.ImageField(upload_to=utils.FileUpload.upload_to, verbose_name='تصویر گروه کالا'),
        ),
        migrations.AlterField(
            model_name='product',
            name='image_name',
            field=models.ImageField(upload_to=utils.FileUpload.upload_to, verbose_name='تصویر کالا'),
        ),
        migrations.AlterField(
            model_name='productgallery',
            name='image_name',
            field=models.ImageField(upload_to=utils.FileUpload.upload_to, verbose_name='تصویر کالا'),
        ),
        migrations.AlterField(
            model_name='productgroup',
            name='image_name',
            field=models.ImageField(upload_to=utils.FileUpload.upload_to, verbose_name='تصویر گروه کالا'),
        ),
        migrations.AlterField(
            model_name='productgroup',
            name='published_date',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='تاریخ انتشار'),
        ),
        migrations.AlterField(
            model_name='productgroup',
            name='register_date',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='تاریخ درج'),
        ),
        migrations.AlterField(
            model_name='productgroup',
            name='update_date',
            field=models.DateTimeField(auto_now=True, verbose_name='تاریخ آخرین بروز رسانی'),
        ),
    ]
