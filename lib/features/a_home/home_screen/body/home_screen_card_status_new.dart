import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/theme/colors.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/theme/custom_text_style.dart';
import '../../models/home_model.dart';
import 'home_v_divider.dart';

class HomeScreenCardStatusNew extends StatelessWidget {
  const HomeScreenCardStatusNew({
    super.key,
    required this.deliveryBillsItem,
  });

  final DeliveryBills? deliveryBillsItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91.v,
      width: double.infinity,
      margin: EdgeInsetsDirectional.symmetric(
        horizontal: 16.h,
        vertical: 6.v,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: Colors.white,
      ),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8.h),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 4.v,
                  bottom: 4.v,
                  start: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${deliveryBillsItem?.bILLSRL ?? ''}',
                      maxLines: 1,
                      style: CustomTextStyles.title12GrayColorMedium,
                    ),
                    SizedBox(height: 8.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Status',
                              maxLines: 1,
                              style: CustomTextStyles.title10GrayColorMedium,
                            ),
                            SizedBox(height: 8.v),
                            Text(
                              // '${deliveryBillsItem?.dLVRYSTATUSFLG ?? ''}',
                              'New',
                              maxLines: 1,
                              style: CustomTextStyles.title16GreenColorMedium,
                            ),
                          ],
                        ),
                        HomeVDivider(),
                        Column(
                          children: [
                            Text(
                              'Total price',
                              maxLines: 1,
                              style: CustomTextStyles.title10GrayColorMedium,
                            ),
                            SizedBox(height: 8.v),
                            Text(
                              '${deliveryBillsItem?.doubleBILLAMT?.round() ?? ''} LE',
                              maxLines: 1,
                              style: CustomTextStyles.title16GrayColorMedium,
                            ),
                          ],
                        ),
                        HomeVDivider(),
                        Column(
                          children: [
                            Text(
                              'Date',
                              maxLines: 1,
                              style: CustomTextStyles.title10GrayColorMedium,
                            ),
                            SizedBox(height: 8.v),
                            Text(
                              '${deliveryBillsItem?.bILLDATE ?? ''}',
                              maxLines: 1,
                              style: CustomTextStyles.title16GrayColorMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 44.h,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(8.h),
                  topEnd: Radius.circular(8.h),
                ),
                color: greenColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Order Details',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.title8WhiteColorMedium,
                  ),
                  SizedBox(height: 2.adaptSize),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: whiteColor,
                    size: 10.adaptSize,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
