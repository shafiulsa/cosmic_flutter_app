import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/authentication/views/forget_pasword/forget_password.dart';
import 'package:e_commerce_app/features/authentication/views/signup/signup.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

class SLoginForm extends StatelessWidget {
  const SLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: SText.email,
          ),
        ),
        SizedBox(height:SSizes.spaceBtwInputFields),
        //Password
        TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: SText.password,
              suffixIcon: Icon(Icons.panorama_fish_eye)
          ),
        ),
        SizedBox(height: SSizes.spaceBtwInputFields/2),

        //Remimiber me & Forgot password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Remember me
            Row(
              children: [
                Checkbox(value: true, onChanged: (value){}),
                Text(SText.rememberMe)
              ],
            ),

            //Forgot
            TextButton(onPressed: ()=>Get.to(()=>ForgetPasswordScreen()), child: Text(SText.forgetPassword))
          ],
        ),
        SizedBox(height:SSizes.spaceBtwInputFields),
        //sign in
        SElevatedButton(onPress: (){},child: Text(SText.signIn)),
        SizedBox(height:SSizes.spaceBtwItems),
        //Create Account
        SizedBox(
          width: double.infinity,
          // Wrap the navigation logic inside an anonymous function
          child: OutlinedButton(
              onPressed: () {
                Get.to(() => SignUpScreen());
              },
              child: Text(SText.createAccount)
          ),
        )
      ],
    );
  }
}
