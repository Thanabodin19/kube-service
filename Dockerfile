FROM python:3

WORKDIR /data

RUN pip install django==3.2

COPY . .

RUN python manage.py migrate

RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('cdtiadmin', 'admin@example.com', 'cdti1234')" | python manage.py shell

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]


