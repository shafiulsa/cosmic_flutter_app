import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SHomeAppBar extends StatelessWidget {
  const SHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SAppBarr(
      // showBackArrow: true,

      //Title and SubTitle
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Text(
            SHelperFunction.getGreetingMessage(),
            style: Theme
                .of(
              context,
            )
                .textTheme
                .labelMedium!
                .apply(color: SColors.grey),
          ),
          //subtitle
          Obx(
             () {
                if (controller.profileLoading.value) {
                  return SShimmerEffect(width: 80,height: 15);
                }
                return Text(
                  controller.user.value.fullName,
                  style: Theme
                      .of(
                    context,
                  )
                      .textTheme
                      .headlineSmall!
                      .apply(color: SColors.white),
                );

              }
          ),
        ],
      ),
      // Bag Icon
      actions: [
        SCartCounterIcon()

      ],
    );
  }
}
