from django.urls import path
from .views import ArticleListCreateView, ArticleRetrieveView, ArticleUpdateView, ArticleDeleteView, ArticleCreateView

urlpatterns = [
    path('articles/', ArticleListCreateView.as_view(), name='article_list_create'),
    path('articles/<int:pk>/', ArticleRetrieveView.as_view(), name='article_retrieve'),
    path('articles/<int:pk>/update/', ArticleUpdateView.as_view(), name='article_update'),
    path('articles/<int:pk>/delete/', ArticleDeleteView.as_view(), name='article_delete'),
    path('articles/create/', ArticleCreateView.as_view(), name='article_create'),
]
