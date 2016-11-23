```
virtualenv --distribute venv
cd venv/ ; source bin/activate
pip install Django
python -c 'import django; print django.get_version()'
django-admin.py startproject mysite
cd mysite
python manage.py runserver
```


```
python manage.py migrate
```

建立 app
1. `python manage.py startapp {app_name}`
2. setting.py -> INSTALLED_APPS 增加 {app_name}
3. `vim {app_name}/model.py` : 編輯 model
4. `python manage.py makemigrations` : 產生 migration 檔
5. `python manage.py migrate`

```

```