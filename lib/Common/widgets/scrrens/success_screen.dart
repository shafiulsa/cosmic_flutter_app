import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.title, required this.subTitle, required this.image, required this.onTap});
  final String title, subTitle, image;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [

              /// Image
              Image.asset(image, height: SDeviceHelper.getScreenWidth(context) * 0.6),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Title
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Subtitle
              Text(subTitle, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
              SizedBox(height: SSizes.spaceBtwSections),

              /// Continue
              SElevatedButton(onPress: onTap, child: Text(SText.uContinue))
            ],
          ),
        ),
      ),
    );
  }
}
