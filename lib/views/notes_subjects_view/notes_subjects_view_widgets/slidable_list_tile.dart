import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';

class SlidableListTile extends StatelessWidget {
  final String title;
  final String? route;
  final Widget? trailer;
  final Widget? leading;
  final Function onTap;
  const SlidableListTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.route,
    this.trailer,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _validatePress(context);
            },
            backgroundColor: Theme.of(context).colorScheme.background,
            foregroundColor: Colors.black,
            icon: Icons.push_pin,
            label: 'Pin',
          ),
        ],
      ),
      child: ListTile(
        onTap: () => onTap(),
        trailing: trailer,
        leading: leading,
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }

  _validatePress(BuildContext context) {
    if (route != null) {
      if (homeViewController.chipTitles.length < 8) {
        if (GetStorage().read(title) == null) {
          GetStorage().write(title, route);
          homeViewController.chipTitles.add(title);
          homeViewController.updateChipsStorage();
        } else {
          customSnackBar(
            context,
            message: "Already Pinned !!!",
          );
        }
      } else {
        customSnackBar(
          context,
          message: "You Can Pin Only 8 Subjects !",
        );
      }
    } else {
      customSnackBar(
        context,
        message: "Only Subjects Can be Pinned !",
      );
    }
  }
}
