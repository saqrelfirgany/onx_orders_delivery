import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../controllers/language_cubit.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
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
        style: CustomTextStyles.titleLargeBluegray70001SemiBold,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: actions,
      leadingWidth: 50.h,
      centerTitle: true,
    );
  }
}
