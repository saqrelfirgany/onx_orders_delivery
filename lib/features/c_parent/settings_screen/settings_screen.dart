import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/app_bar/home_app_bar.dart';
import '../../../core/controllers/language_cubit.dart';
import '../../../core/theme/custom_text_style.dart';
import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../../../l10n/app_localizations.dart';
import '../../../route/app_route_names.dart';
import 'Settings_cubit.dart';
import 'body/SettingsAppearanceSection.dart';
import 'body/SettingsNotificationsSection.dart';
import 'body/SettingsSupportSection.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return BlocProvider<SettingsCubit>(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          log('ParentProfileScreen state ${state.submissionStatus}');

          return Scaffold(
            appBar: HomeAppBar(title: l10n.settings),
            body: SafeArea(
              child: SizedBox(
                width: mediaQueryData.size.width,
                child: RefreshIndicator(
                  onRefresh: () => cubit.init(),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 20.v),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.v),
                      child: Column(
                        children: [
                          SizedBox(height: 16.v),

                          /// Name and Phone section
                          // SettingsNamePhoneSection(cubit: cubit),
                          // SizedBox(height: 26.v),

                          /// Appearance section
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              l10n.appearance,
                              style: CustomTextStyles.titleLargeBluegray70001SemiBold,
                            ),
                          ),
                          SizedBox(height: 16.v),
                          SettingsAppearanceSection(),
                          SizedBox(height: 36.v),

                          /// Notifications section
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              l10n.notifications,
                              style: CustomTextStyles.titleLargeBluegray70001SemiBold,
                            ),
                          ),
                          SizedBox(height: 16.v),
                          SettingsNotificationsSection(),
                          SizedBox(height: 36.v),

                          /// Security section
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(
                          //     l10n.security,
                          //     style: CustomTextStyles.titleLargeBluegray70001SemiBold,
                          //   ),
                          // ),
                          // SizedBox(height: 14.v),
                          // SettingsSecuritySection(),
                          // SizedBox(height: 26.v),

                          /// About section
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              l10n.about,
                              style: CustomTextStyles.titleLargeBluegray70001SemiBold,
                            ),
                          ),
                          SizedBox(height: 16.v),
                          SettingsSupportSection(
                            title: l10n.aboutUS,
                            onTap: () {
                              // cubit.setSelectedInfo(key: 'about');
                              // context.push(AppRouteName.infoScreenRoute);
                            },
                          ),
                          SizedBox(height: 16.v),
                          SettingsSupportSection(
                            title: l10n.privacyPolicy,
                            onTap: () {
                              // cubit.setSelectedInfo(key: 'policy');
                              // context.push(AppRouteName.infoScreenRoute);
                            },
                          ),
                          SizedBox(height: 16.v),
                          SettingsSupportSection(
                            title: l10n.termsConditions,
                            onTap: () {
                              // cubit.setSelectedInfo(key: 'terms');
                              // context.push(AppRouteName.infoScreenRoute);
                            },
                          ),

                          /// Support section
                          SizedBox(height: 36.v),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              l10n.support,
                              style: CustomTextStyles.titleLargeBluegray70001SemiBold,
                            ),
                          ),
                          SizedBox(height: 16.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Text(l10n.social, style: theme.textTheme.titleMedium)),
                              // Spacer(),
                              CustomImageView(
                                onTap: () => cubit.openLink(url: 'tel:+966569155530'),
                                imagePath: 'assets/contacts_icons/contacts_phone.svg',
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                              ),
                              SizedBox(width: 16.h),
                              CustomImageView(
                                onTap: () => cubit.openLink(
                                  url: 'whatsapp://send?phone=+966569155530',
                                ),
                                imagePath: 'assets/contacts_icons/contacts_whatsapp.svg',
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                              ),
                              // SizedBox(width: 8.h),
                              // CustomImageView(
                              //   onTap: () => cubit.openLink(
                              //     url: '${cubit.contactsModel.contactsFacebook}',
                              //   ),
                              //   imagePath: 'assets/contacts_icons/contacts_facebook.svg',
                              //   height: 25.adaptSize,
                              //   width: 25.adaptSize,
                              //   margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                              // ),
                              // SizedBox(width: 8.h),
                              // CustomImageView(
                              //   onTap: () => cubit.openLink(
                              //     url: '${cubit.contactsModel.contactsTwitter}',
                              //   ),
                              //   imagePath: 'assets/contacts_icons/contacts_twitter.svg',
                              //   height: 25.adaptSize,
                              //   width: 25.adaptSize,
                              //   margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                              // ),
                              // SizedBox(width: 8.h),
                              // CustomImageView(
                              //   onTap: () => cubit.openLink(
                              //     url: '${cubit.contactsModel.contactsInstagram}',
                              //   ),
                              //   imagePath: 'assets/contacts_icons/contacts_instagram.svg',
                              //   height: 25.adaptSize,
                              //   color: Colors.black,
                              //   width: 25.adaptSize,
                              //   margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                              // ),
                              // SizedBox(width: 8.h),
                              // CustomImageView(
                              //   onTap: () => cubit.openLink(
                              //     url: '${cubit.contactsModel.contactsSnapchat}',
                              //   ),
                              //   imagePath: 'assets/contacts_icons/contacts_snapchat.svg',
                              //   height: 25.adaptSize,
                              //   width: 25.adaptSize,
                              //   margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                              // ),
                              // SizedBox(width: 8.h),
                              // CustomImageView(
                              //   onTap: () => cubit.openLink(
                              //     url: '${cubit.contactsModel.contactsYoutube}',
                              //   ),
                              //   imagePath: 'assets/contacts_icons/contacts_youtube.svg',
                              //   height: 25.adaptSize,
                              //   width: 25.adaptSize,
                              //   margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
                              // ),
                              // SizedBox(width: 16.h),
                            ],
                          ),
                          SizedBox(height: 24.v),
                          SettingsSupportSection(
                            title: l10n.contactUs,
                            onTap: () {
                              context.push(AppRouteName.contactUsScreenRoute);
                            },
                          ),
                          SizedBox(height: 24.v),
                          SettingsSupportSection(
                            title: l10n.signOut,
                            onTap: () {
                              cubit.logout(context: context);
                            },
                          ),
                          SizedBox(height: 24.v),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
