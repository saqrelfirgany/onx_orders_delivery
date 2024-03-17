import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../core/components/app_bar/back_app_bar.dart';
import '../../../core/utils/size_utils.dart';
import 'info_cubit.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocProvider<InfoCubit>(
      create: (context) => InfoCubit(),
      child: BlocConsumer<InfoCubit, InfoState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<InfoCubit>();

          return Scaffold(
            appBar: BackAppBar(title: '${cubit.infoModel.infosTitle}'),
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
                          HtmlWidget('${cubit.infoModel.infosDesc}'),
                          SizedBox(height: 16.v),
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
