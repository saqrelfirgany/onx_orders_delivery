// import 'package:bnoud/core/utils/size_utils.dart';
// import 'package:flutter/material.dart';
//
// import '../../features/home/home_screen/home_screen.dart';
// import '../theme/app_decoration.dart';
// import '../theme/theme_helper.dart';
// import '../utils/image_constant.dart';
// import 'custom_image_view.dart';
//
// class CustomBottomBar extends StatefulWidget {
//   CustomBottomBar({super.key, this.onChanged});
//
//   Function(BottomBarEnum)? onChanged;
//
//   @override
//   CustomBottomBarState createState() => CustomBottomBarState();
// }
//
// class CustomBottomBarState extends State<CustomBottomBar> {
//   int selectedIndex = 0;
//
//   List<BottomMenuModel> bottomMenuList = [
//     BottomMenuModel(
//       icon: ImageConstant.imgHome,
//       activeIcon: ImageConstant.imgHome,
//       type: BottomBarEnum.Home,
//       screen: HomeScreen(),
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgSchool,
//       activeIcon: ImageConstant.imgSchool,
//       type: BottomBarEnum.School,
//       screen: Container(
//         child: Center(
//           child: Text('School'),
//         ),
//       ),
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgUser,
//       activeIcon: ImageConstant.imgUser,
//       type: BottomBarEnum.User,
//       screen: Container(
//         child: Center(
//           child: Text('User'),
//         ),
//       ),
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgFingerScan,
//       activeIcon: ImageConstant.imgFingerScan,
//       type: BottomBarEnum.Fingerscan,
//       screen: Container(
//         child: Center(
//           child: Text('Fingerscan'),
//         ),
//       ),
//     )
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70.v,
//       decoration: BoxDecoration(
//         color: appTheme.whiteA70001,
//       ),
//       child: BottomNavigationBar(
//         backgroundColor: Colors.transparent,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedFontSize: 0,
//         elevation: 0,
//         currentIndex: selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         items: List.generate(
//           bottomMenuList.length,
//           (index) {
//             return BottomNavigationBarItem(
//               icon: CustomImageView(
//                 imagePath: bottomMenuList[index].icon,
//                 height: 24.adaptSize,
//                 width: 24.adaptSize,
//                 color: appTheme.gray90001,
//               ),
//               activeIcon: Container(
//                 height: 44.adaptSize,
//                 width: 44.adaptSize,
//                 decoration: AppDecoration.primary.copyWith(
//                   // borderRadius: BorderRadiusStyle.circleBorder24,
//                   shape: BoxShape.circle,
//                 ),
//                 child: CustomImageView(
//                   imagePath: bottomMenuList[index].activeIcon,
//                   height: 24.adaptSize,
//                   width: 24.adaptSize,
//                   color: appTheme.whiteA700,
//                   margin: EdgeInsets.symmetric(vertical: 12.v),
//                 ),
//               ),
//               label: '',
//             );
//           },
//         ),
//         onTap: (index) {
//           selectedIndex = index;
//           widget.onChanged?.call(bottomMenuList[index].type);
//           setState(() {});
//         },
//       ),
//     );
//   }
// }
//
// enum BottomBarEnum {
//   Home,
//   School,
//   User,
//   Fingerscan,
// }
//
// class BottomMenuModel {
//   BottomMenuModel({
//     required this.icon,
//     required this.activeIcon,
//     required this.type,
//     required this.screen,
//   });
//
//   String icon;
//
//   String activeIcon;
//
//   BottomBarEnum type;
//   Widget screen;
// }
//
// class DefaultWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(10),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Please replace the respective Widget here',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
