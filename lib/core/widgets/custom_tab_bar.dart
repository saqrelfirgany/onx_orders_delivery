import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../theme/theme_helper.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabviewController,
    required this.tabs,
  });

  final TabController tabviewController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabviewController,
      isScrollable: true,
      labelColor: appTheme.whiteA700,
      labelStyle: TextStyle(fontSize: 18.fSize, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
      unselectedLabelColor: appTheme.gray500,
      unselectedLabelStyle: TextStyle(fontSize: 18.fSize, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
      indicator: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            4.h,
          ),
        ),
      ),
      tabs: tabs,
    );
  }
}
