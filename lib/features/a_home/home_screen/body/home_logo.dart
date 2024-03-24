import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../home_cubit.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageView(
          imagePath: 'assets/home/home_topbar_3x.png',
          width: double.infinity,
          height: 150.v,
          fit: BoxFit.cover,
          radius: BorderRadius.only(
            bottomLeft: Radius.circular(22.adaptSize),
          ),
        ),
        PositionedDirectional(
          top: 46.v,
          start: 16.h,
          child: Container(
            width: 120.h,
            child: Text(
              '${cubit.authRepository.userModel.data?.deliveryName ?? ''}',
              maxLines: 2,
              style: CustomTextStyles.title25WhiteColorSemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
