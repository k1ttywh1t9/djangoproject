from django.contrib import admin

from core.apps.products.models.products import Product


# Register your models here.
@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ("id", "title", "created_at", "updated_at")
