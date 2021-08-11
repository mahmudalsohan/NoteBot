

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reusableListTile({
  required String subjectName,
  required Widget trailer,
  required Function onTap,
}){
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        trailing: trailer,
        onTap: (){
          onTap();
        },
        title: Center(
          child: Text(
            subjectName,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    ),
  );
}