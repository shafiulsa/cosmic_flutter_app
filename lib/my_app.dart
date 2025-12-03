
import 'package:e_commerce_app/buindings/bindings.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/theam/theam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, // digguber likha ta tule dai
        themeMode: ThemeMode.system,  // mobaile ar j theme satai dekhbe
        theme: SAppTheme.lightTheme,
        darkTheme: SAppTheme.darkTheme,
        initialBinding: SBuinding(),
        getPages: SAppRoutes.screens,
        home: Scaffold(
          backgroundColor: SColors.primary,
          body:Center(
            child: CircularProgressIndicator(color: SColors.white,),
          ),
        ),
    );
  }
}
