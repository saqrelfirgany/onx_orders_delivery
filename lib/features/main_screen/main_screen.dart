import 'package:flutter/material.dart';

import '../../../core/theme/app_decoration.dart';
import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/size_utils.dart';
import '../a_home/home_screen/home_screen.dart';
import '../c_parent/settings_screen/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Icons.home,
      activeIcon: Icons.home,
    ),
    // BottomMenuModel(
    //   icon: ImageConstant.imgSchool,
    //   activeIcon: ImageConstant.imgSchool,
    // ),
    BottomMenuModel(
      icon: Icons.settings,
      activeIcon: Icons.settings,
    ),
    // BottomMenuModel(
    //   icon: ImageConstant.imgFingerScan,
    //   activeIcon: ImageConstant.imgFingerScan,
    // )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        items: List.generate(
          bottomMenuList.length,
          (index) {
            return BottomNavigationBarItem(
              icon: Icon(
                bottomMenuList[index].icon,
                size: 24.adaptSize,
                color: appTheme.gray90001,
              ),
              // CustomImageView(
              //   imagePath: bottomMenuList[index].icon,
              //   height: 24.adaptSize,
              //   width: 24.adaptSize,
              //   color: appTheme.gray90001,
              // ),
              activeIcon: Container(
                height: 44.adaptSize,
                width: 44.adaptSize,
                decoration: AppDecoration.primary.copyWith(
                  // borderRadius: BorderRadiusStyle.circleBorder24,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  bottomMenuList[index].icon,
                  size: 24.adaptSize,
                  color: appTheme.whiteA700,
                  // margin: EdgeInsets.symmetric(vertical: 12.v),
                ),
              ),
              label: '', backgroundColor: Colors.transparent,
            );
          },
        ),
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
  });

  IconData icon;

  IconData activeIcon;
}
