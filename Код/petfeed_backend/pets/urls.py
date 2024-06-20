from django.urls import path
from .views import PetRetrieveView, PetCreateView, PetDeleteView, PetUpdateView, PetListCreateView

urlpatterns = [
    path('pets/', PetListCreateView.as_view(), name='pets_list_create'),
    path('pets/<int:pk>/', PetRetrieveView.as_view(), name='pets_retrieve'),
    path('pets/<int:pk>/update/', PetUpdateView.as_view(), name='pets_update'),
    path('pets/<int:pk>/delete/', PetDeleteView.as_view(), name='pets_delete'),
    path('pets/create/', PetCreateView.as_view(), name='pets_create'),
]
