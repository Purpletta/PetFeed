from django.urls import path
from .views import WeightRecordCreateView, WeightRecordDeleteView, WeightRecordUpdateView, WeightRecordListCreateView, WeightRecordRetrieveView

urlpatterns = [
    path('weight_records/', WeightRecordListCreateView.as_view(), name='weight_records_list_create'),
    path('weight_records/<int:pk>/', WeightRecordRetrieveView.as_view(), name='weight_records_retrieve'),
    path('weight_records/<int:pk>/update/', WeightRecordUpdateView.as_view(), name='weight_records_update'),
    path('weight_records/<int:pk>/delete/', WeightRecordDeleteView.as_view(), name='weight_records_delete'),
    path('weight_records/create/', WeightRecordCreateView.as_view(), name='weight_records_create'),
]
