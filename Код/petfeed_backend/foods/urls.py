from django.urls import path
from .views import FoodCreateView, FoodRetrieveView, FoodDeleteView, FoodListCreateView, FoodUpdateView

urlpatterns = [
    path('foods/', FoodListCreateView.as_view(), name='foods_list_create'),
    path('foods/<int:pk>/', FoodRetrieveView.as_view(), name='foods_retrieve'),
    path('foods/<int:pk>/update/', FoodUpdateView.as_view(), name='foods_update'),
    path('foods/<int:pk>/delete/', FoodDeleteView.as_view(), name='foods_delete'),
    path('foods/create/', FoodCreateView.as_view(), name='foods_create'),
]
