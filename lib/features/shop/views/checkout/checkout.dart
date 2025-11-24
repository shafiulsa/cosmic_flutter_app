import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/scrrens/success_screen.dart';
import 'package:e_commerce_app/Common/widgets/textfield/promo_code.dart';
import 'package:e_commerce_app/features/shop/views/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_app/features/shop/views/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/views/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/style/padding.dart';
import '../../../../utils/constans/sizes.dart';
import '../cart/widgets/cart_items.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPress: () => Get.to(
            () => SuccessScreen(
              title: "Payment Successfull",
              subTitle: 'Your item will be shipped Soon !',
              image: SImages.successfulPaymentIcon,
              onTap: ()=> Get.offAll(()=>NavigationMenu()),
            ),
          ),
          child: Text("Chequeout \$121223"),
        ),
      ),
    );
  }
}
