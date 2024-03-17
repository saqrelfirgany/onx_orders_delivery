import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/controllers/language_cubit.dart';
import '../../../core/theme/custom_text_style.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../../../l10n/app_localizations.dart';
import '../../../route/app_route_names.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container();
    // BlocProvider<ParentProfileCubit>(
    //    create: (context) => ParentProfileCubit(),
    //    child: BlocConsumer<ParentProfileCubit, ParentProfileState>(
    //      listener: (context, state) {},
    //      builder: (context, state) {
    //        final cubit = context.read<ParentProfileCubit>();
    //        log('ParentProfileScreen state ${state.submissionStatus}');
    //        final l10n = AppLocalizations.of(context);
    //        final languageCubit = context.read<LanguageCubit>();
    //
    //        return Scaffold(
    //          // resizeToAvoidBottomInset: false,
    //          body: state.isLoadingProjects
    //              ? const CenterMainLoading()
    //              : RefreshIndicator(
    //                  onRefresh: () => cubit.init(),
    //                  child: SingleChildScrollView(
    //                    padding: EdgeInsets.only(
    //                      left: 16.h,
    //                      right: 16.h,
    //                      bottom: 5.v,
    //                      top: 16.v,
    //                    ),
    //                    physics: BouncingScrollPhysics(),
    //                    child: Column(
    //                      crossAxisAlignment: CrossAxisAlignment.start,
    //                      children: [
    //                        SizedBox(height: 36.v),
    //                        Row(
    //                          children: [
    //                            ClipRRect(
    //                              borderRadius: BorderRadius.circular(40.h),
    //                              child: Container(
    //                                height: 72.h,
    //                                width: 72.h,
    //                                decoration: BoxDecoration(
    //                                  shape: BoxShape.circle,
    //                                ),
    //                                child: CustomImageView(
    //                                  imagePath: AppConstants.imageParentOriginal +
    //                                      cubit.parentModel.parentsImage,
    //                                  // height: 72.adaptSize,
    //                                  // width: 72.adaptSize,
    //                                ),
    //                              ),
    //                            ),
    //                            SizedBox(width: 24.h),
    //                            Text(
    //                              cubit.parentModel.parentsName,
    //                              style: CustomTextStyles.titleMediumSemiBold.copyWith(
    //                                color: appTheme.gray90001,
    //                              ),
    //                            )
    //                          ],
    //                        ),
    //                        SizedBox(height: 24.h),
    //                        // Text(
    //                        //   "Payment Options",
    //                        //   style: CustomTextStyles.titleLargeBluegray70001SemiBold,
    //                        // ),
    //                        // SizedBox(height: 14.v),
    //                        // Padding(
    //                        //   padding: EdgeInsets.only(right: 84.h),
    //                        //   child: Row(
    //                        //     children: [
    //                        //       CustomIconButton(
    //                        //         height: 48.adaptSize,
    //                        //         width: 48.adaptSize,
    //                        //         padding: EdgeInsets.all(15.h),
    //                        //         decoration: IconButtonStyleHelper.outlineGray,
    //                        //         child: CustomImageView(
    //                        //           imagePath: ImageConstant.imgGrid,
    //                        //         ),
    //                        //       ),
    //                        //       Padding(
    //                        //         padding: EdgeInsets.only(
    //                        //           left: 16.h,
    //                        //           top: 11.v,
    //                        //           bottom: 12.v,
    //                        //         ),
    //                        //         child: Text(
    //                        //           "Add a debit /credit card",
    //                        //           style: CustomTextStyles.titleMediumPrimary,
    //                        //         ),
    //                        //       ),
    //                        //     ],
    //                        //   ),
    //                        // ),
    //                        // SizedBox(height: 33.v),
    //                        Text(
    //                          l10n.familyMembers,
    //                          style: CustomTextStyles.titleLargeBluegray70001SemiBold,
    //                        ),
    //                        SizedBox(height: 14.v),
    //                        Padding(
    //                          padding: EdgeInsetsDirectional.only(end: 89.h),
    //                          child: ListView.separated(
    //                            physics: const NeverScrollableScrollPhysics(),
    //                            shrinkWrap: true,
    //                            separatorBuilder: (
    //                              context,
    //                              index,
    //                            ) {
    //                              return SizedBox(height: 16.v);
    //                            },
    //                            itemCount: cubit.childModelList.length,
    //                            itemBuilder: (context, index) {
    //                              return Container(child: cubit.childModelList[index]);
    //                            },
    //                          ),
    //                        ),
    //                        SizedBox(height: 33.v),
    //                        _buildFrame(context),
    //                        SizedBox(height: 5.v),
    //                      ],
    //                    ),
    //                  ),
    //                ),
    //        );
    //      },
    //    ),
    //  );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return GestureDetector(
      onTap: () {
        context.push(AppRouteName.settingsScreenRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.settings,
            style: CustomTextStyles.titleLargeBluegray70001SemiBold,
          ),
          CustomImageView(
            imagePath:
                languageCubit.local == 'ar' ? ImageConstant.imgArrowLeft : ImageConstant.imgArrowRightGray500,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(bottom: 4.v),
          ),
        ],
      ),
    );
  }
}
