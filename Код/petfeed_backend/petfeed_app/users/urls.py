from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet
from . import views, views_auth
router = DefaultRouter()
router.register(r'users', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('api/token/', views_auth.token_obtain_pair_view, name='token_obtain_pair'),
    path('api/token/refresh/', views_auth.token_refresh_view, name='token_refresh'),
    path('api/token/verify/', views_auth.token_verify_view, name='token_verify'),
]
