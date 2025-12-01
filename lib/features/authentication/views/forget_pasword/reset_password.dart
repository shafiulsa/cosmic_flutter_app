import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/features/authentication/views/login/login.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPAsswordScreen extends StatelessWidget {
  const ResetPAsswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller =ForgetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.offAll(()=>LoginScreen()), icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(children: [
/// image
             Image.asset(SImages.mailSentImage,height: SDeviceHelper.getScreenHeight(context)*0.6),
           SizedBox(height: SSizes.spaceBtwItems),
            /// title
            Text(SText.resetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: SSizes.spaceBtwItems),
            /// Subttile
            Text(email,style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: SSizes.spaceBtwItems),
            /// Subttile
            Text(SText.resetPasswordSubTitle,style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: SSizes.spaceBtwItems),

            /// Done
            SElevatedButton(onPress: ()=>Get.offAll(LoginScreen()), child: Text(SText.done)),
            /// Resend Email
            SizedBox(height: SSizes.spaceBtwItems),
            SizedBox(
               width: SDeviceHelper.getScreenHeight(context),
                child: TextButton(onPressed: ()=> controller.reSendPasswordResetEmail(), child: Text(SText.resendEmail)))
          ]),
        ),
      ),
    );
  }
}
