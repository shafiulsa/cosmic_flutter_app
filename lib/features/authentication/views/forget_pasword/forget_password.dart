import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: SPadding.screenPadding, child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header
            //title
            Text(SText.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: SSizes.spaceBtwItems),
            //subtitle
            Text(SText.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium),
            //form

            SizedBox(height: SSizes.spaceBtwSections*2),
            Column(
              children: [
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: (value)=> SValidator.validateEmail(value),
                    decoration: InputDecoration(
                      labelText: SText.email,
                      prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                SizedBox(height: SSizes.spaceBtwItems),
                SElevatedButton(onPress: ()=> controller.sendPasswordResetEmail(),child: Text(SText.submit))
              ],
            )

          ],
        )),
      ),
    );
  }
}
