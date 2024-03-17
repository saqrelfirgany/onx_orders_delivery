import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/theme_helper.dart';

void showToastError({required String body}) {
  Fluttertoast.showToast(
    msg: body,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showToast({required String body, Toast toastLength = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
    msg: body,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: theme.colorScheme.primary,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
