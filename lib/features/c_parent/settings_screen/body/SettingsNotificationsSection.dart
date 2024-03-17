import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/controllers/language_cubit.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/widgets/custom_switch.dart';
import '../../../../l10n/app_localizations.dart';

class SettingsNotificationsSection extends StatelessWidget {
  const SettingsNotificationsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.v),
      decoration: AppDecoration.outlineGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24.v),
            child: Text(l10n.notifications, style: theme.textTheme.titleMedium),
          ),
          CustomSwitch(
            margin: EdgeInsets.only(top: 2.v, right: 7.h, bottom: 24.v),
            value: false,
            onChange: (value) {
              // isSelectedSwitch1 = value;
            },
          )
        ],
      ),
    );
  }
}
