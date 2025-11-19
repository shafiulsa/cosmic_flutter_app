import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/button/social_button.dart';
import 'package:e_commerce_app/Common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce_app/features/authentication/views/login/widgets/login_form.dart';
import 'package:e_commerce_app/features/authentication/views/login/widgets/login_header.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),

      body:SingleChildScrollView(
        child:     Padding(
          padding: SPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //header
              SLoginHeader(),
              SizedBox(height: SSizes.spaceBtwItems),
              //form
              SLoginForm(),

              SizedBox(height: SSizes.spaceBtwItems),
              //devider
              SFormDevider(title: SText.orSignInWith,),
              SizedBox(height: SSizes.spaceBtwSections),
              //footer
              SSocialButton()
            ],
          ),
        ),
      )


    );
  }
}
