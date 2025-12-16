import 'package:e_commerce_app/Common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controllers/order/order_controller.dart';
import 'package:e_commerce_app/features/shop/models/order_model.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/widgets/custome_shape/rounded_container.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/sizes.dart';

class SOrderslistItems extends StatelessWidget {
  const SOrderslistItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        // Handle Error, Loading and Empty State
        final nothingFound = SAnimationLoader(
          text: 'No order yet!',
          showActionButton: true,
          actionText: 'Let\'s fill in!',
          animation: SImages.pencilAnimation,
          onPressed: () => Get.offAll(() =>  NavigationMenu()),
        );
        final widget = SCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          nothingFound: nothingFound,
        );
        if (widget != null) return widget;

        List<OrderModel> orders = snapshot.data!;
        return ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(height: SSizes.spaceBtwItems),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            OrderModel order=orders[index];
            return SRoundedContainer(
              showBorder: true,
              backgroundColor: dark ? SColors.dark : SColors.light,
              padding: EdgeInsets.all(SSizes.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // // / 1 - Row
                  Row(
                    children: [
                      Icon(Iconsax.ship),
                      SizedBox(width: SSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .apply(color: SColors.textPrimary),
                            ),
                            // Assuming UColors.textPrimary -> SColors.textPrimary
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.arrow_right_34, size: SSizes.iconSm),
                      ),
                      // Column
                    ],
                  ), // Row

                  SizedBox(height: SSizes.spaceBtwItems),
                  //  2 - Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Details
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.tag),
                            SizedBox(width: SSizes.spaceBtwItems / 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  // Assuming UColors.textPrimary -> SColors.textPrimary
                                  Text(
                                    order.id,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //shippind Data
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.calendar),
                            SizedBox(width: SSizes.spaceBtwItems / 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping Date',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  // Assuming UColors.textPrimary -> SColors.textPrimary
                                  Text(
                                    order.formattedDeliveryDate,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), // Row
                ],
              ),
            ); // SRoundedContainer
          },
        );
      },
    );
  }
}
