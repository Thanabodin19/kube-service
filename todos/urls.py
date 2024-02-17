from django.urls import path
from . import views

app_name='todos'
urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('hello/', views.HelloView.as_view(),name='home'),
    path('<int:todo_id>/delete', views.delete, name='delete'),
    path('<int:todo_id>/update', views.update, name='update'),
    path('add/', views.add, name='add')
]