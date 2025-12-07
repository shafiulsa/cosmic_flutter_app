import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SSocialButton extends StatelessWidget {
  const SSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginControlle());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Google button
        buildButton(SImages.googleIcon ,controller.googleSignIn),
        SizedBox(width: SSizes.spaceBtwItems),

        //facebook button
        buildButton(SImages.facebookIcon,(){}),

      ],
    );
  }

  Container buildButton(String image,VoidCallback onPress) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: SColors.grey),
            borderRadius: BorderRadius.circular(100)
        ),
        child:  IconButton(onPressed: onPress, icon: Image.asset(image,height: SSizes.iconMd,width: SSizes.iconMd)),
      );
  }
}
