import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/authentication/views/signup/verify_email.dart';
import 'package:e_commerce_app/features/authentication/views/signup/widgets/privacy_policy_chequebox.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:iconsax/iconsax.dart';

class SSignUpForm extends StatelessWidget {
  const SSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: SText.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            SizedBox(width: SSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
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
          decoration: InputDecoration(
            labelText: SText.email,
            prefixIcon: Icon(Iconsax.user),
          ),
        ),
        SizedBox(height: SSizes.spaceBtwItems),

        //Phone
        TextFormField(
          decoration: InputDecoration(
            labelText: SText.phoneNumber,
            prefixIcon: Icon(Iconsax.user),
          ),
        ),
        SizedBox(height: SSizes.spaceBtwItems),

        //password
        TextFormField(
          decoration: InputDecoration(
            labelText: SText.password,
            prefixIcon: Icon(Iconsax.user),
            suffixIcon: Icon(Icons.panorama_fish_eye),
          ),
        ),
        SizedBox(height: SSizes.spaceBtwItems),

        //privecy policy chequebox
        SPrivacyPolicyChekbox(),
        SizedBox(height: SSizes.spaceBtwItems),

        SElevatedButton(onPress: ()=>Get.to(()=>VerifyEmailScreen()),child: Text(SText.createAccount))

      ],
    );
  }
}

