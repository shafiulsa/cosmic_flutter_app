import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/textfield/promo_code.dart';
import 'package:e_commerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/order/order_controller.dart';
import 'package:e_commerce_app/features/shop/views/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_app/features/shop/views/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/views/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/pricing_calculator.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/style/padding.dart';
import '../../../../utils/constans/sizes.dart';
import '../cart/widgets/cart_items.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    double subTotal = cartController.totalCartPrice.value;
    double totalPrice = SPricingCalculator.calculateTotalPrice(subTotal,'Bangladesh');
    final orderController = Get.put(OrderController());

    return Scaffold(
      /// ----- [AppBar] -----
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      /// ----- [Body] -----
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              /// Items
              SCartItems(showAddRemoveButton: false),
              SizedBox(height: SSizes.spaceBtwSections),

              /// Promo code - TextField
              SPromoCodeField(), // SRoundedContainerd
              SizedBox(height: SSizes.spaceBtwSections),

              /// Billing amount section
              SRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(SSizes.md),
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    SBillingAmountSecton(),

                    /// Billing payment section
                    SBillingPaymentSection(),

                    SBillingAddresSection(),
                  ],
                ), // Column
              ), // SRoundedContainer
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
      /// -----[Botoom Navigation]-----
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: SElevatedButton(
          // Inside your widget's build method or onPressed function
          onPress: subTotal > 0
              ? () => orderController.processOrder(totalPrice)
              :
                  SSnackBarHelpers.errorSnackBar(
                    title: 'Empty Cart',
                    message: 'No items in the cart',
                  ),


          // Example of the checkout button
          child: Text(
            'Checkout ${SText.currency}${totalPrice.toStringAsFixed(2)}',
          ),
        ),
      ),
    );
  }
}
