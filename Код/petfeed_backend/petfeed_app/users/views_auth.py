from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

token_obtain_pair_view = TokenObtainPairView.as_view()
token_refresh_view = TokenRefreshView.as_view()
token_verify_view = TokenVerifyView.as_view()
