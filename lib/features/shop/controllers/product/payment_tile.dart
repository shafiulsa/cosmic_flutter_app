import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/models/payment_method_model.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SPaymentTile extends StatelessWidget {
  const SPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller =CheckoutController.instance;
    return ListTile(
      onTap: () {
  controller.selectedPaymentMethod.value=paymentMethod;
  Get.back();
      },
      contentPadding: EdgeInsets.zero,
      leading: SRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: SHelperFunction.isDarkMode(context)
            ? SColors.light
            : SColors.white,
        padding: EdgeInsets.all(SSizes.sm),
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
