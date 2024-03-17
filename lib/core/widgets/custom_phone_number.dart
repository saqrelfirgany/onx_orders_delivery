import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../theme/custom_text_style.dart';
import 'custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    required this.controller,
    required Country country,
    required Null Function(Country country) onTap,
  }) : super(
          key: key,
        );

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 222.h,
              right: 6.h,
            ),
            child: CustomTextFormField(
              width: 1.h,
              controller: controller,
              hintText: "Enter phone number",
              hintStyle: CustomTextStyles.bodyLargeRoboto,
              textInputType: TextInputType.phone,
              contentPadding: EdgeInsets.symmetric(horizontal: -291.h),
            ),
          ),
        ),
      ],
    );
  }
}
