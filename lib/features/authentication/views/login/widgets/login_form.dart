import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/features/authentication/views/forget_pasword/forget_password.dart';
import 'package:e_commerce_app/features/authentication/views/signup/signup.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SLoginForm extends StatelessWidget {
  const SLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginControlle.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => SValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.message),
              labelText: SText.email,
            ),
          ),
          SizedBox(height: SSizes.spaceBtwInputFields),
          // //Password
          // TextFormField(
          //   controller: controller.password,
          //     validator: (value) =>SValidator.validatePassword(value),
          //   decoration: InputDecoration(
          //     prefixIcon: Icon(Icons.email),
          //     labelText: SText.password,
          //     suffixIcon: Icon(Icons.panorama_fish_eye),
          //   ),
          // ),

          /// Password
          Obx(
              ()=>TextFormField(
              validator: (value) => SValidator.validateEmptyText('Password',value),
              controller: controller.password,
              obscureText: controller.isPasswordVisible.value,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: SText.password,
                suffixIcon: IconButton(
                  onPressed: ()=> controller.isPasswordVisible.toggle(),
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ), // InputDecoration
            ),
          ), // TextFormField

          SizedBox(height: SSizes.spaceBtwInputFields / 2),

          //Remimiber me & Forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Remember me
              Row(
                children: [
                  Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=> controller.rememberMe.toggle())),
                  Text(SText.rememberMe),
                ],
              ),

              //Forgot
              TextButton(
                onPressed: () => Get.to(() => ForgetPasswordScreen()),
                child: Text(SText.forgetPassword),
              ),
            ],
          ),
          SizedBox(height: SSizes.spaceBtwInputFields),
          //sign in
          SElevatedButton(
            onPress: () =>controller.loginWithEmailAndPassword(),
            child: Text(SText.signIn),
          ),
          SizedBox(height: SSizes.spaceBtwItems),
          //Create Account
          SizedBox(
            width: double.infinity,
            // Wrap the navigation logic inside an anonymous function
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => SignUpScreen());
              },
              child: Text(SText.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
