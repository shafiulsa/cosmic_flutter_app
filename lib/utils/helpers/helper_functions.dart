import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SHelperFunction{
  SHelperFunction._();
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness==Brightness.dark;
  }
}