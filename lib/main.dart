import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  /// Widgets Binding
  final  widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // the divide will not auto roated in phone roatation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}


