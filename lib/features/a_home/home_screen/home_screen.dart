import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/features/a_home/home_screen/body/explore_search_toggle_button.dart';

import '../../../core/components/loading/main_loaing.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/utils/size_utils.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/home_repo.dart';
import 'body/home_logo.dart';
import 'body/home_screen_list.dart';
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

  bool isNewIndex = true;

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
          log('cubit homeModel length::${cubit.homeModel.data?.deliveryBills?.length ?? 0}');

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
                      HomeLogo(cubit: cubit),
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
                                isActive: isNewIndex,
                                title: l10n.newTitle,
                                onPressed: () {
                                  setState(() {
                                    isNewIndex = true;
                                  });
                                },
                              ),
                              ExploreSearchToggleButton(
                                isActive: !isNewIndex,
                                title: l10n.others,
                                onPressed: () {
                                  setState(() {
                                    isNewIndex = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 58.v),
                      HomeScreenList(cubit: cubit, isNewIndex: isNewIndex),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
