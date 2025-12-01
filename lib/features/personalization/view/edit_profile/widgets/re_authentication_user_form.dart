import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticationUserForm extends StatelessWidget {
  const ReAuthenticationUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: SAppBarr(showBackArrow: true,title: Text("Re Authenticate user form")),
        body: SingleChildScrollView(
          child: Padding(
            padding: SPadding.screenPadding,
            child: Form(
              key: controller.reAuthFormKey, // Assuming a key like _formKey
              child: Column(
                children: [
                  // // / Email
                  TextFormField(
                    controller: controller.email,
                    validator: SValidator.validateEmail,
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: SText.email), // Assuming STexts.email
                  ), // TextFormField
                  SizedBox(height: SSizes.spaceBtwInputFields),
                  // // / Password
                  Obx(
                    ()=>TextFormField(
                      controller: controller.password,
                      obscureText: controller.isPasswordVisible.value,
                      validator: (value) => SValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: SText.password,
                        suffixIcon: IconButton(onPressed: () =>controller.isPasswordVisible.toggle(), icon: Icon(controller.isPasswordVisible.value?Iconsax.eye : Iconsax.eye_slash)),
                      ), // InputDecoration
                    ),
                  ), // TextFormField
                  SizedBox(height: SSizes.spaceBtwInputFields),
                  // // / Verify Button
                  SElevatedButton(onPress: () => controller.reAuthenticateUser(), child: Text('Verify')),
                ],
              ), // Column
            ), // Form
          ), // Padding
        ) // SingleChildScrollView
    );
  }
}
