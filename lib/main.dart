import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/route/app_route_names.dart';
import 'package:saqrelfirgany/route/router.dart';

import 'core/controllers/language_cubit.dart';
import 'core/dependencies/dependencies.dart' as dep;
import 'core/dependencies/dependencies.dart';
import 'core/helper/helper.dart';
import 'core/theme/theme_helper.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'notifications/firebase_notifiucations.dart';
import 'notifications/local_notification_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await init();
  await Future.wait(
    [
      dep.setup(),
    ],
  );

  runApp(
    const MyApp(),
  );
}

Future<void> init() async {
  Helper.token = await Helper.getUserToken();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final LanguageCubit languageCubit = serviceLocator<LanguageCubit>();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    // _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: 10), _logoutUser);
  }

  void _logoutUser() {
    log('_logoutUser');
    // Navigate to the login screen
    navigatorKey.currentState!.context.go(AppRouteName.loginScreenRoute);
    // Navigator.of(context).pushReplacementNamed(AppRouteName.loginScreenRoute);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _startTimer();
    } else if (state == AppLifecycleState.resumed) {
      _startTimer();
    }
  }

  // Initialize notifications
  void initNotifications() async {
    FirebaseNotifications.initNotifications(context: context);
    await FirebaseNotifications.firebaseMessaging.getToken();
    await LocalNotificationService.instance.initNotificationSettings();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Helper.getUserLang();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'OnX Orders Delivery',
            debugShowCheckedModeBanner: false,
            theme: theme,
            // darkTheme: theme,
            supportedLocales: L10n.all,
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            builder: FlutterSmartDialog.init(),
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
