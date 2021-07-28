import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          home: HomeScreen(),
          theme: themeProvider.isDarkTheme
              ? MyThemes.darkTheme
              : MyThemes.lightTheme,
        );
      },
    );
  }
}
