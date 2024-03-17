import 'package:flutter/material.dart';

import '../../constants/fonts_helper.dart';
import '../buttons/app_confirm_button.dart';

Future showConfirmAlertDialog({
  required BuildContext context,
  required String text,
  String confirmText = 'confirm',
  required VoidCallback onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      content: IntrinsicHeight(
        child: SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                text,
                style: AppFonts.fontW700(color: Colors.black),
                textAlign: TextAlign.start,
                maxLines: 50,
              ),
              SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    child: AppConfirmButton(
                      title: 'Confirm',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppConfirmButton(
                      title: 'Confirm',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
