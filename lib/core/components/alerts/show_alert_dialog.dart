import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../l10n/app_localizations.dart';
import '../../theme/theme_helper.dart';
import '../buttons/app_border_button.dart';
import '../buttons/app_confirm_button.dart';

void showAlertDialog({
  String text = '',
  List<dynamic> textList = const [],
  required VoidCallback press,
  TextAlign textAlign = TextAlign.start,
  bool canClose = true,
  bool isConfirm = false,
  double? height = 200,
  double? width = 360,
}) {
  SmartDialog.show(
    clickMaskDismiss: canClose,
    builder: (context) {
      final l10n = AppLocalizations.of(context);
      return Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 16,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            text.isEmpty
                ? const SizedBox()
                : Text(
                    text,
                    style: theme.textTheme.bodyMedium,
                    textAlign: textAlign,
                    maxLines: 50,
                  ),
            textList.isEmpty
                ? const SizedBox()
                : Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      children: List.generate(
                        textList.length,
                        (index) => Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: theme.colorScheme.primary),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textList[index],
                                style: theme.textTheme.bodyMedium,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 26),
            isConfirm
                ? Row(
                    children: [
                      Expanded(
                        child: AppConfirmButton(
                          title: l10n.confirm,
                          onTap: press,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppBorderButton(
                          title: l10n.cancel,
                          onTap: () => SmartDialog.dismiss(),
                        ),
                      ),
                    ],
                  )
                : AppConfirmButton(
                    onTap: press,
                    title: l10n.cancel,
                  ),
          ],
        ),
      );
    },
  );
  // showDialog(
  //   context: context,
  //   barrierDismissible: canClose,
  //   builder: ((context) {
  //     return AlertDialog(
  //       backgroundColor: Colors.white,
  //       shadowColor: Colors.white,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(10),
  //         ),
  //       ),
  //       content: SizedBox(
  //         width: 120,
  //         height: 300,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             const SizedBox(height: 16),
  //             text.isEmpty
  //                 ? const SizedBox()
  //                 : Text(
  //                     text,
  //                     style: AppFonts.fontW500(),
  //                     textAlign: textAlign,
  //                     maxLines: 50,
  //                   ),
  //             textList.isEmpty
  //                 ? const SizedBox()
  //                 : Expanded(
  //                     child: ListView(
  //                       shrinkWrap: true,
  //                       padding: EdgeInsets.zero,
  //                       physics: const BouncingScrollPhysics(),
  //                       children: List.generate(
  //                         textList.length,
  //                         (index) => Container(
  //                           margin: const EdgeInsets.all(4),
  //                           decoration: const BoxDecoration(
  //                             border: Border(
  //                               bottom: BorderSide(color: AppColors.activeColor),
  //                             ),
  //                           ),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 textList[index],
  //                                 style: AppFonts.fontW500(),
  //                                 maxLines: 3,
  //                               ),
  //                               const SizedBox(height: 8),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //             if (hasButton) const SizedBox(height: 26),
  //             if (hasButton)
  //               AppConfirmButton(
  //                 onTap: press,
  //                 title: buttonText,
  //               ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }),
  // );
}
