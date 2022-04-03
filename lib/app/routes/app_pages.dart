import 'package:get/get.dart';
import 'package:todo/app/modules/home/bindings/home_binding.dart';
import 'package:todo/app/modules/home/views/home_view.dart';
import 'package:todo/app/modules/profile/bindings/profile_binding.dart';
import 'package:todo/app/modules/profile/views/profile_view.dart';
import 'package:todo/app/modules/settings/bindings/settings_binding.dart';
import 'package:todo/app/modules/settings/views/settings_view.dart';
import 'package:todo/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:todo/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:todo/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:todo/app/modules/welcome/views/signin.dart';
import 'package:todo/app/modules/welcome/views/welcome_view.dart';

import '../modules/welcome/bindings/login_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SignInView(),
      binding: LoginBinding(),
    ),
  ];
}
