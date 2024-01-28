import 'package:get/get.dart';
import 'package:watchhub/features/authentication/screen/login/login.dart';
import 'package:watchhub/features/authentication/screen/onboarding/onboarding.dart';
import 'package:watchhub/features/authentication/screen/password_configuration/forget_password.dart';
import 'package:watchhub/features/authentication/screen/signup/signup.dart';
import 'package:watchhub/features/authentication/screen/signup/verify_email.dart';
import 'package:watchhub/features/personalization/screen/address/address.dart';
import 'package:watchhub/features/personalization/screen/profile/profile.dart';
import 'package:watchhub/features/personalization/screen/settings/settings.dart';
import 'package:watchhub/features/shop/screen/cart/cart.dart';
import 'package:watchhub/features/shop/screen/checkout/checkout.dart';
import 'package:watchhub/features/shop/screen/home/home.dart';
import 'package:watchhub/features/shop/screen/order/order.dart';
import 'package:watchhub/features/shop/screen/product_reviews/product_reviews.dart';
import 'package:watchhub/features/shop/screen/store/store.dart';
import 'package:watchhub/features/shop/screen/wishlist/wishlist.dart';
import 'package:watchhub/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: WHRoutes.home, page: () => const HomeScreen()),
    GetPage(name: WHRoutes.store, page: () => const StoreScreen()),
    GetPage(name: WHRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: WHRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: WHRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: WHRoutes.order, page: () => const OrderScreen()),
    GetPage(name: WHRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: WHRoutes.cart, page: () => const CartScreen()),
    GetPage(name: WHRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: WHRoutes.userProfile, page: () => const UserAddressScreen()),
    GetPage(name: WHRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: WHRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: WHRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: WHRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: WHRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}