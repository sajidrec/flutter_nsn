import 'package:get/get.dart';
import 'package:nsn/app/modules/bottom_navbar/presentation/binding/bottom_navbar_binding.dart';
import 'package:nsn/app/modules/bottom_navbar/presentation/views/bottom_navbar.dart';
import '../modules/auth/forget_password_page/binding/forget_password_binding.dart';
import '../modules/auth/forget_password_page/views/forget_password_page.dart';
import '../modules/auth/login_page/presentation/binding/login_page_binding.dart';
import '../modules/auth/login_page/presentation/views/login_page.dart';
import '../modules/auth/reset_password_page/presentation/binding/reset_password_page_binding.dart';
import '../modules/auth/reset_password_page/presentation/views/reset_password_page.dart';
import '../modules/auth/signup_page/presentation/binding/signup_page_binding.dart';
import '../modules/auth/signup_page/presentation/views/signup_page.dart';
import '../modules/auth/signup_page/presentation/views/welcome_signup_page.dart';
import '../modules/auth/splash_page/presentation/views/splash_page.dart';
import '../modules/auth/verification_code_page/presentation/binding/verification_code_page_binding.dart';
import '../modules/auth/verification_code_page/presentation/view/verification_code_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splashRoute, page: () => SplashPage()),
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpRoute,
      page: () => SignupPage(),
      binding: SignupPageBinding(),
    ),

    GetPage(
      name: AppRoutes.signUpWelcomeRoute,
      page: () => WelcomeSignupPage(),
    ),
    GetPage(
      name: AppRoutes.forgetPassRoute,
      page: () => ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.verificationCodeRoute,
      page: () => VerificationCodePage(),
      binding: VerificationCodePageBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassRoute,
      page: () => ResetPasswordPage(),
      binding: ResetPasswordPageBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNavbarRoute,
      page: () => BottomNavbar(),
      binding: BottomNavbarBinding(),
    ),
  ];
}
