from django.shortcuts import render, redirect, reverse, HttpResponse
from app01 import models
import json
import random
from django.http import JsonResponse
from django.contrib import auth
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from app01.MyFormsTask import LoginForm
from app01.MyFormsTask import RegisterForm
from app01.MyFormsTask import SetPwdForm


# Create your views here.


@login_required
def list_book(request):
    if request.method == 'GET':
        books = models.Book.objects.all()
        return render(request, 'list_book.html', {'books': books,
                                                  'usr': request.session.get('usr'), })

    else:
        return redirect(reverse('list_book'))


@login_required
def add_book(request):
    if request.method == 'GET':
        publish_list = models.Publish.objects.all()
        authors_list = models.Author.objects.all()
        return render(request, 'add_book.html',
                      {'publish_list': publish_list,
                       'authors_list': authors_list,
                       'usr': request.session.get('usr'),

                       })
    else:
        authors_list = request.POST.getlist('authors_list')
        books = request.POST.dict()
        del books['csrfmiddlewaretoken']

        if authors_list:
            del books['authors_list']
            book_obj = models.Book.objects.create(**books)
            book_obj.authors.add(*authors_list)
        else:
            models.Book.objects.create(**books)
        return redirect(reverse('list_book'))


@login_required
def del_book(request):
    book_id = json.loads(request.body)['book_id']
    ret = {'status': True, 'msg': ''}
    models.Book.objects.filter(id=book_id).delete()
    return JsonResponse(ret)

    # 当models里面book类的null=True未设置时：
    # authors_obj_list = models.Author.objects.filter(book__id=book_id).all()
    # book_obj = models.Book.objects.filter(id=book_id).first()
    # if authors_obj_list:
    #     book_obj.authors.clear()
    # book_obj.delete()
    # return JsonResponse(ret)


@login_required
def edit_book(request, book_id):
    if request.method == 'GET':
        publish_list = models.Publish.objects.all()
        authors_list = models.Author.objects.all()
        book = models.Book.objects.filter(id=book_id).first()
        return render(request, 'edit_book.html', {
            'book': book,
            'publish_list': publish_list,
            'authors_list': authors_list,
            'usr': request.session.get('usr'),

        })
    else:
        authors_list = request.POST.getlist('authors_list')
        books = request.POST.dict()
        del books['csrfmiddlewaretoken']
        book_obj = models.Book.objects.filter(id=book_id).first()
        if authors_list:
            del books['authors_list']
        book_obj.authors.set(authors_list)
        models.Book.objects.filter(id=book_id).update(**books)
        return redirect(reverse('list_book'))


def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            usr = data['username']
            pwd = data['password']
            user_obj = auth.authenticate(username=usr, password=pwd)
            ret = {'msg': ''}
            code = request.POST.get('code')
            keep = request.session.get('keep')
            if not code.upper() == keep.upper():
                ret['msg'] = '验证码错误！'
                return render(request, "login.html", {"form": form, "ret": ret})
            if user_obj:
                auth.login(request, user_obj)
                path = request.GET.get('next') or "/list_book/"
                return redirect(path)
            else:
                ret['msg'] = '用户名或密码错误!'
                return render(request, "login.html", {"form": form, "ret": ret})
        else:
            clear_errors = form.errors.get("__all__")
            return render(request, "login.html", {"form": form, "clear_errors": clear_errors})
    form = LoginForm()
    return render(request, "login.html", {'form': form})


def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            ret = {'msg': ''}
            data = form.cleaned_data
            usr = data['username']
            pwd = data['password']
            code = request.POST.get('code')
            keep = request.session.get('keep')
            if not code.upper() == keep.upper():
                ret['msg'] = '验证码错误！'
                return render(request, "register.html", {"form": form, "ret": ret})
            if User.objects.filter(username=usr):
                ret['msg'] = '用户名已存在！'
                return render(request, "register.html", {'ret': ret, "form": form})
            else:
                new_user = User.objects.create_user(username=usr, password=pwd)
                new_user.save()
                auth.login(request, new_user)
                return redirect("/list_book/")
        else:
            clear_errors = form.errors.get("__all__")
            return render(request, "register.html", {"form": form, "clear_errors": clear_errors})
    form = RegisterForm()
    return render(request, 'register.html', {'form': form})


@login_required
def set_pwd(request):
    user = request.user
    if request.method == 'POST':
        form = SetPwdForm(request.POST)
        if form.is_valid():
            ret = {'msg': ''}
            data = form.cleaned_data
            o_pwd = data['o_password']
            pwd = data['password']
            if user.check_password(o_pwd):
                user.set_password(pwd)
                user.save()
                auth.login(request, user)
                return redirect("/list_book/")
            else:
                ret['msg'] = '原密码错误！'
                return render(request, 'set_pwd.html', {'form': form, 'ret': ret})
        else:
            clear_errors = form.errors.get("__all__")
            return render(request, 'set_pwd.html', {'form': form, "clear_errors": clear_errors})
    form = SetPwdForm()
    return render(request, 'set_pwd.html', {'form': form})


def logout(request):
    auth.logout(request)
    return redirect(reverse('login'))


def get_random_color():
    return random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)


def code_img(request):
    from io import BytesIO
    from PIL import Image, ImageDraw, ImageFont
    img = Image.new("RGB", (250, 40), get_random_color())  # 新建图片大小为250*40
    draw = ImageDraw.Draw(img)  # 可以在该图片对象上写内容
    font = ImageFont.truetype("statics/font/georgiab.ttf", 30)  # 指定字体，需自行下载字体文件

    keep = ""
    for i in range(5):  # 获取随机数
        random_num = str(random.randint(2, 9))
        random_low_alpha = chr(random.randint(97, 122))
        random_upper_alpha = chr(random.randint(65, 90))
        random_char = random.choice([random_num, random_low_alpha, random_upper_alpha])
        draw.text((20 + i * 35, 0), random_char, get_random_color(), font=font)
        keep += random_char

    # 噪点噪线
    width = 250
    height = 40
    for i in range(10):
        x1 = random.randint(0, width)
        x2 = random.randint(0, width)
        y1 = random.randint(0, height)
        y2 = random.randint(0, height)
        draw.line((x1, y1, x2, y2), fill=get_random_color())

    for i in range(10):
        draw.point([random.randint(0, width), random.randint(0, height)], fill=get_random_color())
        x = random.randint(0, width)
        y = random.randint(0, height)
        draw.arc((x, y, x + 4, y + 4), 0, 90, fill=get_random_color())
    request.session["keep"] = keep
    f = BytesIO()
    img.save(f, "png")
    data = f.getvalue()
    return HttpResponse(data)
