import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../core/helper/helper.dart';
import '../features/a_home/home_screen/home_screen.dart';
import '../features/a_home/new_invoice_screen/new_invoice_screen.dart';
import '../features/c_parent/change_number_screen/change_number_screen.dart';
import '../features/c_parent/contact_us_screen/contact_us_screen.dart';
import '../features/c_parent/info_screen/info_screen.dart';
import '../features/c_parent/logged_in_devices_screen/logged_in_devices_screen.dart';
import '../features/c_parent/parent_profile/parent_profile_screen.dart';
import '../features/c_parent/phone_number_screen/phone_number_screen.dart';
import '../features/c_parent/settings_screen/settings_screen.dart';
import '../features/intro/auth/forget_check_exist_screen/forget_check_exist_screen.dart';
import '../features/intro/auth/login_screen/login_screen.dart';
import '../features/intro/auth/reset_pass_screen/reset_pass_screen.dart';
import '../features/intro/auth/virfaction_forget/virfaction_forget.dart';
import '../features/intro/onboarding_screen/onboarding_screen.dart';
import '../features/intro/splash_screen/splash_screen.dart';
import '../features/main_screen/main_screen.dart';
import '../main.dart';
import 'app_route_names.dart';
import 'error_screen.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  observers: [
    FlutterSmartDialog.observer,
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error ?? GoException('General error message'),
  ),
  routes: [
    /// Home
    GoRoute(
      path: AppRouteName.splashScreenRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRouteName.onBoardingScreenRoute,
      redirect: (context, state) => Helper.token.isEmpty ? null : AppRouteName.mainScreenRoute,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: AppRouteName.mainScreenRoute,
      builder: (context, state) => const MainScreen(),
    ),

    GoRoute(
      path: AppRouteName.homeScreenRoute,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRouteName.newInvoiceScreenRoute,
      builder: (context, state) => NewInvoiceScreen(),
    ),

    /// Parent Profile Screen
    GoRoute(
      path: AppRouteName.parentProfileScreenRoute,
      builder: (context, state) => const ParentProfileScreen(),
    ),
    GoRoute(
      path: AppRouteName.settingsScreenRoute,
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(
      path: AppRouteName.changeNumberScreenRoute,
      builder: (context, state) => ChangeNumberScreen(),
    ),
    GoRoute(
      path: AppRouteName.phoneNumberScreenRoute,
      builder: (context, state) => PhoneNumberScreen(),
    ),
    GoRoute(
      path: AppRouteName.loggedInDevicesScreenRoute,
      builder: (context, state) => LoggedInDevicesScreen(),
    ),
    GoRoute(
      path: AppRouteName.infoScreenRoute,
      builder: (context, state) => InfoScreen(),
    ),
    GoRoute(
      path: AppRouteName.contactUsScreenRoute,
      builder: (context, state) => ContactUsScreen(),
    ),

    /// Auth
    GoRoute(
      path: AppRouteName.loginScreenRoute,
      builder: (context, state) => const LoginScreen(),
      redirect: (context, state) => Helper.token.isNotEmpty ? AppRouteName.loginScreenRoute : null,
    ),

    GoRoute(
      path: AppRouteName.forgetPasswordScreenRoute,
      builder: (context, state) => ForgetCheckExistScreen(),
    ),
    GoRoute(
      path: AppRouteName.vitrificationForgetScreenRoute,
      builder: (context, state) => VitrificationForgetScreen(),
    ),
    GoRoute(
      path: AppRouteName.resetPassScreenRoute,
      builder: (context, state) => ResetPassScreen(),
    ),
  ],
);
