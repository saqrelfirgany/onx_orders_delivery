import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/theme/colors.dart';

class HomeVDivider extends StatelessWidget {
  const HomeVDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.adaptSize,
      height: 47.v,
      color: grayColor,
    );
  }
}
