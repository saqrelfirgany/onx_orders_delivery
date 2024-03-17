import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../controllers/language_cubit.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final Locale appLocale = Localizations.localeOf(context);
    final languageCubit = context.read<LanguageCubit>();

    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.titleLarge!.copyWith(
          color: appTheme.gray90001,
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      leading: AppbarLeadingIconbutton(
        imagePath:
            languageCubit.local == 'en' ? ImageConstant.imgArrowEnd : ImageConstant.imgArrowrightPrimary,
        margin: EdgeInsetsDirectional.only(
          start: 2.h,
          top: 14.v,
          bottom: 11.v,
        ),
        onTap: () => context.pop(),
      ),
      actions: actions,
      leadingWidth: 50.h,
      centerTitle: true,
    );
  }
}
