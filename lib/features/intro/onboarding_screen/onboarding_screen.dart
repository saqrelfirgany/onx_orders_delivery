import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/theme/custom_text_style.dart';
import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../route/app_route_names.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int activeIndex = 0;

  List<OnBoardModel> onBoardData = [];

  @override
  void initState() {
    activeIndex = 0;
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final l10n = AppLocalizations.of(context);
    onBoardData = [
      OnBoardModel(
        image: 'assets/lottie/onboarding1.json',
        secImage: '',
        title: l10n.welcomeLogin,
        description: l10n.welcomeLogin2,
      ),
      OnBoardModel(
        image: 'assets/lottie/onboarding2.json',
        secImage: ImageConstant.img77c4db1127ea4,
        title: '',
        description: l10n.welcomeLogin3,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onBoardData.length,
                onPageChanged: (value) {
                  setState(() {
                    activeIndex = value;
                  });
                },
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: OnBoardContent(
                    image: onBoardData[index].image,
                    secImage: onBoardData[index].secImage,
                    title: onBoardData[index].title,
                    description: onBoardData[index].description,
                    isAtSchool: onBoardData[index].isAtSchool,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.v,
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: onBoardData.length,
                effect: ScrollingDotsEffect(
                  spacing: 5.5,
                  activeDotColor: theme.colorScheme.primary,
                  activeDotScale: 1.6,
                  dotHeight: 5.v,
                  dotWidth: 5.h,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        text: activeIndex == (onBoardData.length - 1) ? l10n.getStarted : l10n.next,
        onPressed: () {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
          if (activeIndex == (onBoardData.length - 1)) {
            context.push(AppRouteName.loginScreenRoute);
          }
        },
        margin: EdgeInsets.only(
          left: 16.h,
          right: 16.h,
          bottom: 64.v,
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.secImage,
    required this.title,
    required this.description,
    this.isAtSchool = false,
  }) : super(key: key);

  final String image, secImage, title, description;
  final bool isAtSchool;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Lottie.asset(
          image,
          height: 297.v,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 24.v),
        title.isEmpty
            ? const SizedBox()
            : Text(
                title,
                style: CustomTextStyles.headlineSmallSemiBold,
              ),
        SizedBox(height: 16.v),
        Container(
          width: 247.h,
          margin: EdgeInsets.symmetric(horizontal: 49.h),
          child: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyLargeGray9000118.copyWith(
              height: 1.78,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class OnBoardModel {
  final String image, secImage, title, description;
  final bool isAtSchool;

  OnBoardModel({
    required this.image,
    required this.secImage,
    required this.title,
    required this.description,
    this.isAtSchool = false,
  });
}
