import 'package:butex_notebot/controllers/home_view_controller.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/auth_dialog.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/dashboard_section.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/pin_section.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'home_view_widgets/drawer_items.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeViewController());
    //Future.delayed(Duration.zero, () => authDialog(context));
    return Scaffold(
      appBar: customAppBar(context: context, title: "Notebot"),
      drawer: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: drawerItems,
        ),
      ),
      body: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 15),
            //
            Carousel(),
            //
            //
            SizedBox(height: 20),
            //
            //Shortcut Chips Container
            PinSection(),
            //
            //
            SizedBox(height: 40),
            //
            //
            //Grid Container
            DashboardSection(),
          ],
        ),
      ),
    );
  }
}
