import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget reusableListTile({
  bool isSlidable = false,
  required String titleName,
  Widget? trailer,
  required Function onTap,
}) {
  return Column(
    children: [
      isSlidable
          ? Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.push_pin,
                    label: 'Pin',
                  ),
                ],
              ),
              child: ListTile(
                onTap: () => onTap(),
                trailing: trailer,
                title: Center(
                  child: Text(
                    titleName,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          : ListTile(
              onTap: () => onTap(),
              trailing: trailer,
              title: Center(
                child: Text(
                  titleName,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
      Divider(),
    ],
  );
}
