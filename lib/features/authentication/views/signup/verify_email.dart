import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/Common/widgets/scrrens/success_screen.dart';
import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:e_commerce_app/features/authentication/views/login/login.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticatonRepository.instance.logout(),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              /// image
              Image.asset(
                SImages.mailSentImage,
                height: SDeviceHelper.getScreenHeight(context) * 0.6,
              ),
              SizedBox(height: SSizes.spaceBtwItems),

              /// title
              Text(
                SText.verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Subttile
              Text(email ?? "", style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Subttile
              Text(
                SText.verifyEmailSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: SSizes.spaceBtwItems),

              /// Continue
              SElevatedButton(
                onPress: controller.checkEmailVerificationStatus,
                child: Text(SText.uContinue),
              ),

              /// Resend Email
              SizedBox(height: SSizes.spaceBtwItems),
              SizedBox(
                width: SDeviceHelper.getScreenHeight(context),
                child: TextButton(
                  onPressed: controller.sendEmailVarification,
                  child: Text(SText.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
