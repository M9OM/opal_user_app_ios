// import 'package:flutter/material.dart';
// import 'package:opal_user_app/controller/pageview_controller.dart';
// import 'package:opal_user_app/views/home/booking/preview_order.dart';
// import 'package:opal_user_app/views/home/booking/step1/setLoction.dart';
// import 'package:opal_user_app/views/home/booking/step2/step2.dart';
// import 'package:opal_user_app/views/home/booking/step3/step3.dart';
// import 'package:provider/provider.dart';

// class PageContainer extends StatelessWidget {
//   const PageContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(30)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Consumer<PageViewProvider>(
//         builder: (context, pageProvider, child) {
//           return PageView(
//             controller: pageProvider.pageController,
//             // physics: const NeverScrollableScrollPhysics(),
//             onPageChanged: (index) {
//               Provider.of<PageViewProvider>(context, listen: false)
//                   .setPage(index);
//             },
//             children: [
//               SetLocation(),
//               Step2Page(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
