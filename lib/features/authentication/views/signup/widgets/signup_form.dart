import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:e_commerce_app/features/authentication/views/signup/widgets/privacy_policy_chequebox.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SSignUpForm extends StatelessWidget {
  const SSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;

    return Form(
      key: controller.signUpForKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      SValidator.validateEmptyText("First name", value),
                  decoration: InputDecoration(
                    labelText: SText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: SSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      SValidator.validateEmptyText("Last name", value),
                  decoration: InputDecoration(
                    labelText: SText.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          //Email
          TextFormField(
            controller: controller.email,
            validator: (value) => SValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: SText.email,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          SizedBox(height: SSizes.spaceBtwItems),

          //Phone
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => SValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: SText.phoneNumber,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          SizedBox(height: SSizes.spaceBtwItems),

          //password
          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordVisble.value,
              controller: controller.password,
              validator: (value) => SValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: SText.password,
                prefixIcon: Icon(Iconsax.user),
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisble.value =
                      !controller.isPasswordVisble.value,
                  icon: Icon(
                    controller.isPasswordVisble.value
                        ? Icons.visibility
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SSizes.spaceBtwItems),

          //privecy policy chequebox
          SPrivacyPolicyChekbox(),
          SizedBox(height: SSizes.spaceBtwItems),

          SElevatedButton(
            onPress: () => controller.registerUser(),
            child: Text(SText.createAccount),
          ),
        ],
      ),
    );
  }
}
