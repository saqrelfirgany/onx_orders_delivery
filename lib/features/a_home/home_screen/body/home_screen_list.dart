import 'package:flutter/material.dart';
import 'package:saqrelfirgany/features/a_home/home_screen/body/home_screen_card_status_delivered.dart';
import 'package:saqrelfirgany/features/a_home/home_screen/body/home_screen_card_status_returned.dart';

import '../../models/home_model.dart';
import '../home_cubit.dart';
import 'home_screen_card_status_delivering.dart';
import 'home_screen_card_status_new.dart';

class HomeScreenList extends StatelessWidget {
  const HomeScreenList({
    super.key,
    required this.cubit,
    required this.isNewIndex,
  });

  final HomeCubit cubit;
  final bool isNewIndex;

  Widget conditionalWidget({required DeliveryBills deliveryBillsItem}) {
    switch ('${deliveryBillsItem.dLVRYSTATUSFLG}') {
      // case '0':
      //   return HomeScreenCardStatusNew(deliveryBillsItem: deliveryBillsItem);
      case '1':
        return HomeScreenCardStatusDelivering(deliveryBillsItem: deliveryBillsItem);
      case '2':
        return HomeScreenCardStatusDelivered(deliveryBillsItem: deliveryBillsItem);
      case '3':
        return HomeScreenCardStatusReturned(deliveryBillsItem: deliveryBillsItem);
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.zero,
        children: List.generate(
          cubit.homeModel.data?.deliveryBills?.length ?? 0,
          (index) {
            DeliveryBills? deliveryBillsItem = cubit.homeModel.data?.deliveryBills?[index];

            return deliveryBillsItem == null || deliveryBillsItem.dLVRYSTATUSFLG == null
                ? const SizedBox()
                : isNewIndex
                    ? HomeScreenCardStatusNew(deliveryBillsItem: deliveryBillsItem)
                    : conditionalWidget(deliveryBillsItem: deliveryBillsItem);
          },
        ),
      ),
    );
  }
}
