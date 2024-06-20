from django.urls import path
from .views import PetFeedListCreateView, PetFeedCreateView, PetFeedDeleteView, PetFeedUpdateView, PetFeedRetrieveView

urlpatterns = [
    path('pet_feeds/', PetFeedListCreateView.as_view(), name='pet_feeds_list_create'),
    path('pet_feeds/<int:pk>/', PetFeedRetrieveView.as_view(), name='pet_feeds_retrieve'),
    path('pet_feeds/<int:pk>/update/', PetFeedUpdateView.as_view(), name='pet_feeds_update'),
    path('pet_feeds/<int:pk>/delete/', PetFeedDeleteView.as_view(), name='pet_feeds_delete'),
    path('pet_feeds/create/', PetFeedCreateView.as_view(), name='pet_feeds_create'),
]
