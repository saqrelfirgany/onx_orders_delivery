import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../core/components/app_bar/back_app_bar.dart';
import '../../../core/components/loading/main_loaing.dart';
import '../../../l10n/app_localizations.dart';
import 'contact_us_cubit.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider<ContactUsCubit>(
      create: (context) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ContactUsCubit>();
          return Scaffold(
            extendBody: true,
            // resizeToAvoidBottomInset: false,
            appBar: BackAppBar(title: l10n.contactUs),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 40.v,
                ),
                child: Column(
                  children: [
                    // CustomImageView(
                    //   imagePath: ImageConstant.imgLoginLogo,
                    //   height: 160.adaptSize,
                    //   width: 160.adaptSize,
                    //   radius: BorderRadius.circular(80.h),
                    // ),
                    SizedBox(height: 37.v),
                    CustomTextFormField(
                      controller: cubit.userNameController,
                      hintText: l10n.userName,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 19.v, 10.h, 19.v),
                        child: SizedBox(),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 58.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      controller: cubit.phoneController,
                      hintText: l10n.phoneNumber,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 19.v, 10.h, 19.v),
                        child: SizedBox(),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 58.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      controller: cubit.emailController,
                      hintText: l10n.email,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 19.v, 10.h, 19.v),
                        child: SizedBox(),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 58.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      controller: cubit.messageController,
                      hintText: l10n.contactUsMessage,
                      maxLines: 7,
                      textInputAction: TextInputAction.done,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 19.v, 10.h, 19.v),
                        child: SizedBox(),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 58.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    SizedBox(height: 25.v),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: state.submissionStatus == SubmissionStatus.inProgress
                ? Padding(
                    padding: EdgeInsets.only(bottom: 64.v),
                    child: MainLoading(),
                  )
                : CustomElevatedButton(
                    text: l10n.send,
                    onPressed: () {
                      // cubit.onSubmit(context: context);
                    },
                    margin: EdgeInsets.only(
                      left: 16.h,
                      right: 16.h,
                      bottom: 64.v,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
