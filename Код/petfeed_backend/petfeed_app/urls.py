from django.urls import path, include
from rest_framework import routers
from .views import PetViewSet, UsersViewSet, SettingsViewSet, Weight_RecordsViewSet, Pet_FeedsViewSet, FoodsViewSet, ArticleViewSet

router = routers.DefaultRouter()
router.register(r'pets', PetViewSet)
router.register(r'users', UsersViewSet)
router.register(r'settings', SettingsViewSet)
router.register(r'weight_records', Weight_RecordsViewSet)
router.register(r'pet_feeds', Pet_FeedsViewSet)
router.register(r'foods', FoodsViewSet)
router.register(r'articles', ArticleViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
