import 'package:get/get.dart';

import '../modules/add_product/add_product_binding.dart';
import '../modules/add_product/add_product_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/list_user/list_user_binding.dart';
import '../modules/list_user/list_user_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/other_product/other_product_binding.dart';
import '../modules/other_product/other_product_view.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/view_product/view_product_binding.dart';
import '../modules/view_product/view_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.signup,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_PRODUCT,
      page: () => ViewProductView(),
      binding: ViewProductBinding(),
    ),
    GetPage(
      name: _Paths.OTHER_PRODUCT,
      page: () => const OtherProductView(),
      binding: OtherProductBinding(),
    ),
    GetPage(
      name: _Paths.LIST_USER,
      page: () => ListUserView(),
      binding: ListUserBinding(),
    ),
  ];
}
