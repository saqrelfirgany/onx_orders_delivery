import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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

class _MyAppState extends State<MyApp> {
  final LanguageCubit languageCubit = serviceLocator<LanguageCubit>();

  @override
  void initState() {
    super.initState();
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
