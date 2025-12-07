
import 'package:e_commerce_app/features/shop/views/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SCartCounterIcon extends StatelessWidget {
  const SCartCounterIcon({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: ()=> Get.to(()=>CartScreen()),
          icon: Icon(Icons.shop),
          color: SColors.light,
        ),
        //counter text
        Positioned(
            right: 6.0,
            child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(color: dark? SColors.dark : SColors.white,shape: BoxShape.circle),
          child: Center(
            child: Text(
              '2',
              style: Theme.of(context).textTheme.labelLarge!.apply(fontSizeFactor: 0.8 ,color: dark? SColors.white: SColors.dark),
            ),
          ),
        ))
      ],
    );
  }
}
