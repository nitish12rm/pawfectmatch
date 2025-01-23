import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';
import '../features/details/view/detailscreen_view.dart';
import 'bottombar/view/bottombar_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightTheme, // Light theme
        darkTheme: darkTheme, // Dark theme
        themeMode: ThemeMode.light,
        title: 'Flutter Demo',
        home: KNavigationBar()
    );
  }
}