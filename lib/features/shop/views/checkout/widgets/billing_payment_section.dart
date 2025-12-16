import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constans/colors.dart';

class SBillingPaymentSection extends StatelessWidget {
  const SBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final controller = CheckoutController.instance;

    return Column(
      children: [
        /// [Text] - Payment Method
        SSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        SizedBox(height: SSizes.spaceBtwItems / 2),

        Obx(
          ()=> Row(
            children: [
              /// Payment logo
              SRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? SColors.light : SColors.white,
                padding: EdgeInsets.all(SSizes.sm),
                child: Image(
                  image: AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ), // SRoundedContainer
          
              SizedBox(width: SSizes.spaceBtwItems / 2),
          
              /// Payment Name
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ), // Row
      ],
    ); // Column
  }
}
