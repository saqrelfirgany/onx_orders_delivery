import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/features/a_home/home_screen/body/explore_search_toggle_button.dart';

import '../../../core/components/loading/main_loaing.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/theme/custom_text_style.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/home_repo.dart';
import '../../../route/app_route_names.dart';
import 'home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool activeProjects = false;
  final HomeRepository projectsRepository = serviceLocator<HomeRepository>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isNewIndex = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final l10n = AppLocalizations.of(context);
    log('build Home');

    return BlocProvider<HomeCubit>(
      create: (context) => serviceLocator<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          log('state ${state.submissionStatus}');

          return Scaffold(
            key: scaffoldKey,
            extendBody: true,
            body: state.isLoadingProjects
                ? const CenterMainLoading()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Home Logo
                      CustomImageView(
                        imagePath: 'assets/home/home_topbar_3x.png',
                        width: double.infinity,
                        height: 150.v,
                        fit: BoxFit.cover,
                        radius: BorderRadius.only(
                          bottomLeft: Radius.circular(22.adaptSize),
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(18.adaptSize),
                        child: Container(
                          width: 220.h,
                          height: 36.v,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ExploreSearchToggleButton(
                                isActive: true,
                                title: l10n.newTitle,
                                onPressed: () {},
                              ),
                              ExploreSearchToggleButton(
                                isActive: false,
                                title: l10n.others,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 58.v),
                      Row(
                        children: [
                          Text(
                            l10n.enterInvoiceNumber,
                            style: CustomTextStyles.titleLargeBluegray70001,
                          ),
                        ],
                      ),
                      SizedBox(height: 18.v),
                      CustomTextFormField(
                        controller: TextEditingController(),
                        hintText: l10n.invoiceNumber,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        prefix: Container(
                          margin: EdgeInsets.fromLTRB(
                            16.h,
                            19.v,
                            10.h,
                            19.v,
                          ),
                          child: Icon(Icons.numbers),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 58.v,
                        ),
                      ),
                      SizedBox(height: 24.v),
                      CustomElevatedButton(
                        text: l10n.newInvoice,
                        onPressed: () {
                          // cubit.onSubmit(context: context);
                          context.push(AppRouteName.newInvoiceScreenRoute);
                        },
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
