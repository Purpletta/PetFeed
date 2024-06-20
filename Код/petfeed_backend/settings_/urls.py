from django.urls import path
from .views import SettingCreateView, SettingDeleteView, SettingUpdateView, SettingListCreateView, SettingRetrieveView

urlpatterns = [
    path('settings_/', SettingListCreateView.as_view(), name='settings__list_create'),
    path('settings_/<int:pk>/', SettingRetrieveView.as_view(), name='settings__retrieve'),
    path('settings_/<int:pk>/update/', SettingUpdateView.as_view(), name='settings__update'),
    path('settings_/<int:pk>/delete/', SettingDeleteView.as_view(), name='settings__delete'),
    path('settings_/create/', SettingCreateView.as_view(), name='settings__create'),
]
