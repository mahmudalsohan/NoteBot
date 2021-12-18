// import 'package:butex_notebot/constants/asset_path.dart';
// import 'package:butex_notebot/constants/controller.dart';
// import 'package:butex_notebot/views/auth_view/auth_widgets/social_signin_button.dart';
// import 'package:butex_notebot/widgets/custom_snackbar.dart';
// import 'package:flutter/material.dart';
//
// class LoginWidget extends StatelessWidget {
//   const LoginWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Welcome back to ",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           "BUTEX NOTEBOT",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 100),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 25),
//           child: SocialSignInButton(
//             text: 'Continue with Google',
//             assetName: iconGoogle,
//             buttonColor: Colors.white,
//             textColor: Colors.black87,
//             onTap: () async {
//               await networkController.checkConnectivity();
//               if (networkController.isConnected.value) {
//                 authController.googleAuthentication();
//               } else {
//                 customSnackBar(context, message: "No Network !!!");
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
