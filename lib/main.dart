import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/home.dart';
import 'package:simple_calculator/theme_provider.dart';
import 'package:simple_calculator/themes/my_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
            theme: MyThemes.lightTheme(),
            darkTheme: MyThemes.darkTheme(),
            themeMode:
                (provider.isDarkTheme) ?  ThemeMode.dark :ThemeMode.light,
          );
        },
      ),
    );
  }
}
