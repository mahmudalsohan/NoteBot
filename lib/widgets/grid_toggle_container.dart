// import 'package:butex_notebot/constants/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// class GridToggleContainer extends StatelessWidget {
//   const GridToggleContainer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).colorScheme.background,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15, right: 25),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Dashboard Grid Count", style: TextStyle(fontSize: 15)),
//             Row(
//               children: [
//                 Row(
//                   children: [
//                     Obx(
//                       () => Radio<int>(
//                           value: 2,
//                           groupValue: homeViewController.selectedGrid.value,
//                           onChanged: (value) {
//                             homeViewController.selectedGrid.value = 2;
//                             homeViewController.updateGrid();
//                           }),
//                     ),
//                     Text("2"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Obx(
//                       () => Radio<int>(
//                           value: 3,
//                           groupValue: homeViewController.selectedGrid.value,
//                           onChanged: (value) {
//                             homeViewController.selectedGrid.value = 3;
//                             homeViewController.updateGrid();
//                           }),
//                     ),
//                     Text("3"),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
