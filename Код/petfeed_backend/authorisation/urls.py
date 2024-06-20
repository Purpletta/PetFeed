from django.urls import path, include


from .views import UserCreateView,  UserRetrieveView, UserDeleteView, UserListCreateView, UserUpdateView


urlpatterns = [
    path('users/', UserListCreateView.as_view(), name='users_list_create'),
    path('users/<int:pk>/', UserRetrieveView.as_view(), name='users_retrieve'),
    path('users/<int:pk>/update/', UserUpdateView.as_view(), name='users_update'),
    path('users/<int:pk>/delete/', UserDeleteView.as_view(), name='users_delete'),
    path('users/create/', UserCreateView.as_view(), name='users_create'),
]