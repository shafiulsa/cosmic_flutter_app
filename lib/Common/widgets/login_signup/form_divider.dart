import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SFormDevider extends StatelessWidget {
  const SFormDevider({
    super.key,
    required this.title,
  });


  final String title;
  @override
  Widget build(BuildContext context) {
    final dark= SHelperFunction.isDarkMode(context);
    return Row(
      children: [
        Expanded(child: Divider(indent: 60,endIndent: 5,thickness: 0.5,color: dark? SColors.darkGrey:SColors.grey)),
        Text(SText.orSignInWith,style: Theme.of(context).textTheme.labelMedium),
        Expanded(child: Divider(indent: 5,endIndent: 60,thickness: 0.5,color: dark? SColors.darkGrey:SColors.grey))
      ],
    );
  }
}

