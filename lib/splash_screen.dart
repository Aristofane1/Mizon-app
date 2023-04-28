// import 'package:flutter/material.dart';
// import 'package:jos_s_application2/core/app_export.dart';

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           width: size.width,
//           height: size.height,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment(
//                 5.48,
//                 -0.81,
//               ),
//               end: Alignment(
//                 0.43,
//                 0.54,
//               ),
//               colors: [
//                 ColorConstant.blue100,
//                 ColorConstant.blueGray900,
//               ],
//             ),
//           ),
//           child: Container(
//             width: size.width,
//             padding: getPadding(
//               left: 132,
//               top: 252,
//               right: 132,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CustomImageView(
//                   svgPath: ImageConstant.imgGroup236,
//                   height: getSize(
//                     110.00,
//                   ),
//                   width: getSize(
//                     110.00,
//                   ),
//                 ),
//                 Padding(
//                   padding: getPadding(
//                     left: 11,
//                     top: 11,
//                     bottom: 5,
//                   ),
//                   child: Text(
//                     "Mizon",
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: ColorConstant.whiteA700,
//                       fontSize: getFontSize(
//                         26.86868667602539,
//                       ),
//                       fontFamily: 'Montserrat',
//                       fontWeight: FontWeight.w700,
//                       height: 1.23,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
