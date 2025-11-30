

import 'package:flutter/material.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';



class UCircularLoader extends StatelessWidget {
  const UCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SSizes.lg),
      decoration: const BoxDecoration(
        color:SColors.primary,
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(color: SColors.white,)
    );
  }
}
