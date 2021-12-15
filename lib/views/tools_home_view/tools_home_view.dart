import 'package:butex_notebot/views/onboarding_view/onboarding_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';

class ToolsHomeView extends StatelessWidget {
  const ToolsHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Tools",
      ),
      body: OnBoardingView(),
    );
  }
}
