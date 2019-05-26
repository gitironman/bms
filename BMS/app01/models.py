from django.db import models


# Create your models here.


class Book(models.Model):
    title = models.CharField(max_length=32)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    publish = models.ForeignKey('Publish', on_delete=models.CASCADE, null=True)
    pub_date = models.DateField()
    authors = models.ManyToManyField('Author')


class Publish(models.Model):
    name = models.CharField(max_length=64)
    city = models.CharField(max_length=64)
    email = models.EmailField()


class Author(models.Model):
    name = models.CharField(max_length=32)
    age = models.IntegerField()
    au_detail = models.OneToOneField('AuthorDetail', on_delete=models.CASCADE)


class AuthorDetail(models.Model):
    tel = models.CharField(max_length=32)
    addr = models.CharField(max_length=64)
    birthday = models.DateField()


# class UserInfo(models.Model):
#     usr = models.CharField(max_length=32)
#     pwd = models.CharField(max_length=64)
