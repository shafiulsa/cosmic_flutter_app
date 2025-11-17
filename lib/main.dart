import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  /// Widgets Binding
  final  widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  /// Await Splash until items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}


