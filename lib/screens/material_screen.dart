import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      home: HomeScreen(),
      theme:
          themeProvider.isDarkTheme ? MyThemes.darkTheme : MyThemes.lightTheme,
    );
  }
}
