import 'package:e_commerce_app/utils/theam/theam.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // digguber likha ta tule dai
        themeMode: ThemeMode.system,  // mobaile ar j theme satai dekhbe
        theme: SAppTheme.lightTheme,
        darkTheme: SAppTheme.darkTheme,
        home: Scaffold(

        )
    );
  }
}
