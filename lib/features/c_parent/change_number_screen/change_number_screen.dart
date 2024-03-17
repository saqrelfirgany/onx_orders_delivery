import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/app_bar/back_app_bar.dart';
import '../../../core/controllers/language_cubit.dart';
import '../../../core/theme/custom_text_style.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../../../l10n/app_localizations.dart';
import '../../../route/app_route_names.dart';

class ChangeNumberScreen extends StatelessWidget {
  const ChangeNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return Scaffold(
      appBar: BackAppBar(title: l10n.changeNumber),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgGroup2675,
              height: 108.v,
              width: 218.h,
            ),
            SizedBox(height: 64.v),
            SizedBox(
              width: 334.h,
              child: Text(
                l10n.useChange,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeBluegray700_1.copyWith(
                  height: 1.75,
                ),
              ),
            ),
            SizedBox(height: 64.v),
            Container(
              width: 321.h,
              margin: EdgeInsets.only(
                left: 7.h,
                right: 6.h,
              ),
              child: Text(
                l10n.toProceed,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeBluegray700_1.copyWith(
                  height: 1.75,
                ),
              ),
            ),
            SizedBox(height: 62.v),
            Text(
              l10n.changeCan,
              style: CustomTextStyles.titleMediumErrorContainer,
            ),
            SizedBox(height: 5.v),
          ],
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        onPressed: () {
          context.push(AppRouteName.phoneNumberScreenRoute);
        },
        text: l10n.agreeTerms,
        margin: EdgeInsets.only(
          left: 14.h,
          right: 18.h,
          bottom: 54.v,
        ),
      ),
    );
  }
}
