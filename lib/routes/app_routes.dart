

import 'package:e_commerce_app/features/authentication/views/forget_pasword/forget_password.dart';
import 'package:e_commerce_app/features/authentication/views/login/login.dart';
import 'package:e_commerce_app/features/authentication/views/onboading/onboading.dart';
import 'package:e_commerce_app/features/authentication/views/signup/signup.dart';
import 'package:e_commerce_app/features/authentication/views/signup/verify_email.dart';
import 'package:e_commerce_app/features/personalization/view/address/address.dart';
import 'package:e_commerce_app/features/personalization/view/edit_profile/edit_profile.dart';
import 'package:e_commerce_app/features/personalization/view/profile/profile.dart';
import 'package:e_commerce_app/features/shop/views/cart/cart.dart';
import 'package:e_commerce_app/features/shop/views/checkout/checkout.dart';
import 'package:e_commerce_app/features/shop/views/order/order.dart';
import 'package:e_commerce_app/features/shop/views/store/store.dart';
import 'package:e_commerce_app/features/shop/views/wishlist/wishlist.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:get/get.dart';

class SAppRoutes{

  static final screens = [
    GetPage(name: SRoutes.home, page: () => const NavigationMenu()),
    GetPage(name: SRoutes.store, page: () => const StoreScreen(),),
    GetPage(name: SRoutes.wishlist, page: () => const WishlistScreen(),),
    GetPage(name: SRoutes.profile, page: () => const ProfileScreen(),),
    GetPage(name: SRoutes.order, page: () => const OrderScreen(),),
    GetPage(name: SRoutes.checkout, page: () => const CheckOutScreen(),),
    GetPage(name: SRoutes.cart, page: () => const CartScreen(),),
    GetPage(name: SRoutes.editProfile, page: () => const EditProfileScreen(),),
    GetPage(name: SRoutes.userAddress, page: () => const AddressScreen(),),
    GetPage(name: SRoutes.signup, page: () => const SignUpScreen(),),
    GetPage(name: SRoutes.verifyEmail, page: () => const VerifyEmailScreen(),),
    GetPage(name: SRoutes.signIn, page: () => const LoginScreen(),),
    GetPage(name: SRoutes.forgetPassword, page: () => const ForgetPasswordScreen(),),
    GetPage(name: SRoutes.onBoarding, page: () => const OnboadingScreeen(),),
  ];
}