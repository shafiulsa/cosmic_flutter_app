import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

class SSocialButton extends StatelessWidget {
  const SSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Google button
        buildButton(SImages.facebookIcon,(){}),
        SizedBox(width: SSizes.spaceBtwItems),

        //facebook button
        buildButton(SImages.googleIcon,(){}),

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
