import 'package:flutter/material.dart';

import '../../../core/components/app_bar/back_app_bar.dart';
import '../../../core/utils/size_utils.dart';
import '../logged_in_devices_screen/widgets/logged_item_widget.dart';

class LoggedInDevicesScreen extends StatelessWidget {
  const LoggedInDevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: BackAppBar(title: 'Logged in Devices'),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.h,
          top: 20.v,
          right: 16.h,
        ),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return LoggedItemWidget(currentDevice: index == 0);
          },
        ),
      ),
    );
  }
}
