import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.items,
    required this.value,
    required this.onChange,
  });

  final void Function(dynamic)? onChange;
  final List<dynamic> items;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: value,
      padding: EdgeInsets.zero,
      dropdownColor: Colors.white,
      focusColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.activeColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.inActiveColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.inActiveColor,
          ),
        ),
      ),
      onChanged: onChange,
      items: items.map(
        (item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item.name),
          );
        },
      ).toList(),
    );
  }
}
