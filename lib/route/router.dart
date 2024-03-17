import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../core/helper/helper.dart';
import '../features/a_home/home_screen/home_screen.dart';
import '../features/intro/auth/login_screen/login_screen.dart';
import '../features/intro/splash_screen/splash_screen.dart';
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
      path: AppRouteName.homeScreenRoute,
      builder: (context, state) => const HomeScreen(),
    ),

    /// Auth
    GoRoute(
      path: AppRouteName.loginScreenRoute,
      builder: (context, state) => const LoginScreen(),
      redirect: (context, state) => Helper.token.isNotEmpty ? AppRouteName.loginScreenRoute : null,
    ),
  ],
);
