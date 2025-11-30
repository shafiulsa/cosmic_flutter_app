import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/button/social_button.dart';
import 'package:e_commerce_app/Common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_app/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:e_commerce_app/features/authentication/views/signup/widgets/signup_form.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              /// Header
              /// title
              Text(
                SText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: SSizes.spaceBtwSections),
              //form
              SSignUpForm(),
              SizedBox(height: SSizes.spaceBtwSections),

              /// devider
              SFormDevider(title: SText.orSignupWith),
              SizedBox(height: SSizes.spaceBtwSections),


              /// Footer
              SSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}

