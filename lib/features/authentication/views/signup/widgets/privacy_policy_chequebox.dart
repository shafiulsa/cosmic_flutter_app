import 'package:e_commerce_app/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPrivacyPolicyChekbox extends StatelessWidget {
  const SPrivacyPolicyChekbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunction.isDarkMode(context);
    final controller=SignUpController.instance;


    return Row(
      children: [
        Obx(()=>Checkbox(value: controller.privacyPolicy.value, onChanged: (value)=>controller.privacyPolicy.value=!controller.privacyPolicy.value)),
        RichText(text: TextSpan(style: Theme.of(context).textTheme.bodyMedium,children: [
          TextSpan(text: ' ${SText.iAgreeTo} '),
          TextSpan(
              text: SText.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color:dark? SColors.white : SColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:dark? SColors.white :  SColors.primary
              )
          ),
          TextSpan(text: ' ${SText.and} '),
          TextSpan(
              text: SText.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color:dark? SColors.white :  SColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark? SColors.white : SColors.primary
              )
          ),
        ])),
      ],
    );
  }
}
