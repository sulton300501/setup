from django.db import models
from django.utils.translation import gettext_lazy as _


class BaseModel(models.Model):
    created_at = models.DateTimeField(_("kiritilgan sana"), auto_now_add=True)
    updated_at = models.DateTimeField(_("o'zgartirilgan sana"), auto_now=True)

    class Meta:
        abstract = True
