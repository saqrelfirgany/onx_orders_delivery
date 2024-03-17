import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/controllers/language_cubit.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/helper/dio_helper.dart';
import '../../../core/helper/helper.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../../../repositories/initial_repo.dart';
import '../../../route/app_route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Define the initial and final positions of the image and the text
  double imageLeft = -216.0; // The width of the image
  double imageTop = 0.0;
  double textRight = -216.0; // The width of the text
  double textTop = 0.0;

  @override
  void initState() {
    Helper.getUserLang();
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      navigateToNextScreen();
    });
    // Start the animation after a short delay
    // Future.delayed(const Duration(milliseconds: 300), () {
    //   setState(() {
    //     // Set the final positions to the center of the screen
    //     // Subtract the width of the image and divide by 2
    //     imageLeft = (mediaQueryData.size.width - 216.h) / 2;
    //     // Subtract the height of the image and divide by 2
    //     imageTop = (mediaQueryData.size.height - 192.v) / 2;
    //     // Subtract the width of the text and divide by 2
    //     textRight = (mediaQueryData.size.width - 200.h) / 2;
    //     // Add the height of the image and the vertical space
    //     textTop = imageTop + 192.v + 9.v;
    //   });
    // });
  }

  Future<void> navigateToNextScreen() async {
    final languageCubit = context.read<LanguageCubit>();
    final InitialRepository initialRepository = serviceLocator<InitialRepository>();
    await Helper.getUserLang();
    DioHelper.init(lang: languageCubit.local);
    context.go(AppRouteName.loginScreenRoute);

    // initialRepository.getContactsData();
    // initialRepository.getInfoData();
    // context.go(AppRouteName.RFIDScreenRoute);
    // if (Helper.token.isNotEmpty) {
    //   context.go(AppRouteName.homeScreenRoute);
    // } else {
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: CustomImageView(
        imagePath: 'assets/splash/splash_2x.png',
        width: double.infinity,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
