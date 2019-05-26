from django import forms
from django.core.exceptions import ValidationError


class RegisterForm(forms.Form):
    username = forms.CharField(min_length=4, label="用户名", error_messages={"required": "用户名不能为空!",
                                                                          "min_length": "用户名太短。"})
    password = forms.CharField(min_length=4, label="密码", error_messages={"required": "密码不能为空!",
                                                                         "min_length": "密码太短。"})
    r_password = forms.CharField(min_length=4, label="确认密码", error_messages={"required": "密码不能为空!",
                                                                              "min_length": "密码太短。"})

    def clean_username(self):
        val = self.cleaned_data.get("username")
        if val.isdigit():
            raise ValidationError("用户名不能是纯数字")
        else:
            return val

    def clean(self):
        val = self.cleaned_data.get("password")
        r_val = self.cleaned_data.get("r_password")

        if val == r_val:
            return self.cleaned_data
        else:
            raise ValidationError("请确认密码是否一致。")


class LoginForm(forms.Form):
    username = forms.CharField(min_length=4, label="用户名", error_messages={"required": "用户名不能为空!",
                                                                          "min_length": "用户名太短。"})
    password = forms.CharField(min_length=4, label="密码", error_messages={"required": "密码不能为空!",
                                                                         "min_length": "密码太短。"})

    def clean_username(self):
        val = self.cleaned_data.get("username")
        if val.isdigit():
            raise ValidationError("用户名不能是纯数字")
        else:
            return val


class SetPwdForm(forms.Form):
    o_password = forms.CharField(min_length=4, label="原密码", error_messages={"required": "原密码不能为空!",
                                                                            "min_length": "原密码太短。"})
    password = forms.CharField(min_length=4, label="新密码", error_messages={"required": "新密码不能为空!",
                                                                          "min_length": "新密码太短。"})
    r_password = forms.CharField(min_length=4, label="确认密码", error_messages={"required": "新密码不能为空!",
                                                                               "min_length": "新密码太短。"})

    def clean(self):
        val = self.cleaned_data.get("password")
        r_val = self.cleaned_data.get("r_password")

        if val == r_val:
            return self.cleaned_data
        else:
            raise ValidationError("请确认新密码是否一致。")
