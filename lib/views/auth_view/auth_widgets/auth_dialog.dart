import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/drawer_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

TextEditingController _idController = TextEditingController();
bool _isValid = true;

int? _batch;
int? _uni_id;
String? _dept;

authDialog(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text(
              "Welcome to BUTEX NoteBOT",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _idController,
                      decoration: InputDecoration(
                        errorText: _isValid ? null : "Invalid ID",
                        errorStyle: TextStyle(color: Colors.red),
                        icon: Icon(Icons.person),
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        hintText: "Student ID",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Please Provide Your Student ID. If You don't have one, select \"NOT APPLICABLE\" ",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      _idController.clear();
                    },
                    child: Text(
                      "Not Applicable",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (_validID(_idController.text)) {
                        //
                        final String? email =
                            FirebaseAuth.instance.currentUser!.email;
                        //
                        // final UserModel? userModel =
                        //     await HttpService().sendUserData(
                        //   dept: _dept,
                        //   id: _uni_id,
                        //   batch: _batch,
                        //   email: email,
                        // );
                        //
                        // print("email: ${userModel?.user.email}");
                        // print("uni_id: ${userModel?.user.uniId}");
                        // print("batch: ${userModel?.user.batch}");
                        // print("dept: ${userModel?.user.dept}");
                        // print("dept: ${userModel?.status}");
                        Get.back();
                      } else {
                        setState(() {
                          _isValid = false;
                        });
                      }
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
      });
}

bool _validID(String idControllerText) {
  if (idControllerText.contains('.') ||
      idControllerText.contains(',') ||
      idControllerText.contains(' ') ||
      idControllerText.contains('-') ||
      idControllerText.isEmpty ||
      idControllerText.startsWith('0')) {
    print("Invalid");
    return false;
  } else {
    if (idControllerText.length == 10 || idControllerText.length == 9) {
      int year;
      int deptSerial;
      int id;
      List parts;

      parts = [
        idControllerText.substring(0, 4), //year of admission
        idControllerText.substring(5, 6), //department serial number
        idControllerText.substring(7), //departmental student id
      ];

      if (idControllerText.length == 10) {
        parts = [
          idControllerText.substring(0, 4),
          idControllerText.substring(5, 7),
          idControllerText.substring(8),
        ];
      }

      year = int.parse(parts[0]);
      deptSerial = int.parse(parts[1]);
      id = int.parse(parts[2]);
      //

      if ((year > 1974) && (deptSerial >= 1 && deptSerial <= 10)) {
        _batch = year - 1974;
        _uni_id = id;

        switch (deptSerial) {
          case 1:
            _dept = "YE";
            break;
          case 2:
            _dept = "FE";
            break;
          case 3:
            _dept = "WPE";
            break;
          case 4:
            _dept = "AE";
            break;
          case 5:
            _dept = "TEM";
            break;
          case 6:
            _dept = "TFD";
            break;
          case 7:
            _dept = "IPE";
            break;
          case 8:
            _dept = "TMDM";
            break;
          case 9:
            _dept = "DCE";
            break;
          case 10:
            _dept = "ESE";
            break;
        }
        return true;
      }

      print("Invalid");
      return false;
    } else {
      print("Invalid");
      return false;
    }
  }
}

/*Get.defaultDialog(
    title: "Welcome to BUTEX NoteBOT",
    titleStyle: TextStyle(
      color: Colors.blue,
      fontSize: 20,
    ),
    barrierDismissible: false,
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Get.width / 1.2,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.withOpacity(.3),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: idController,
              decoration: InputDecoration(
                errorText: homeViewController.errText.value,
                icon: Icon(Icons.person),
                fillColor: Colors.transparent,
                border: InputBorder.none,
                hintText: "Student ID",
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Please Provide Your Student ID. If You don't have one, select \"NOT APPLICABLE\" ",
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
          ),
        ),
      ],
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Not Applicable",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_validID(idController.text)) {
                idController.clear();
                Get.back();
              } else {
                homeViewController.errText.value = "Invalid ID";
              }
            },
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      )
    ],
  )*/

/*xDialog(BuildContext context){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Welcome to BUTEX NoteBOT",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.withOpacity(.3),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextField(
                  controller: null,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    hintText: "Student ID",
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please Provide Your Student ID. If You don't have one, select \"NOT APPLICABLE\" ",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Not Applicable",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          )
        ],
      );
    },
  );}*/
