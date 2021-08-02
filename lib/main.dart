import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/screens/material_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: MaterialScreen(),
        ),
      ],
      child: MaterialScreen(),
    );
  }
}
