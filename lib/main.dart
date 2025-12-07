import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {

  /// Widgets Binding
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
// Flutter native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  print("Initializing GetStorage...");
  // Get storage initialize
 await GetStorage.init();
  print("GetStorage initialized!");
  //firebase inititalization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
    print("Firebase initialized, putting AuthenticatonRepository");
    Get.put(AuthenticatonRepository());   // jokhone firebase k paba tokhone AuthenticatonRepository repositary ar OnReady method call hobe
  });

  // the divide will not auto roated in phone roatation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
