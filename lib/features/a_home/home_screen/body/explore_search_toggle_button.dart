import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/theme/colors.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/theme/custom_text_style.dart';

class ExploreSearchToggleButton extends StatefulWidget {
  const ExploreSearchToggleButton({
    Key? key,
    required this.isActive,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final bool isActive;
  final String title;
  final VoidCallback onPressed;

  @override
  _ExploreSearchToggleButtonState createState() => _ExploreSearchToggleButtonState();
}

class _ExploreSearchToggleButtonState extends State<ExploreSearchToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isActive ? mainColor : whiteColor,
          elevation: 0,
          fixedSize: Size(100, 40.v),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.adaptSize),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 3.v),
          child: Text(
            widget.title,
            style: widget.isActive
                ? CustomTextStyles.title14WhiteColorSemiBold
                : CustomTextStyles.title14MainColorSemiBold,
          ),
        ),
      ),
    );
  }
}
