import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/payment_tile.dart';
import 'package:e_commerce_app/features/shop/models/payment_method_model.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  // Variables
  Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;


  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Cash on delivery', image: SImages.codIcon);
    super.onInit();
  }

  Future<void> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(SSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SSectionHeading(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              SizedBox(height: SSizes.spaceBtwSections),
              // Payment method tiles will be listed here
              SPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Cash on Delevery',
                  image: SImages.codIcon,
                ),
              ),
              SizedBox(height: SSizes.spaceBtwItems / 2),
              // Payment method tiles will be listed here
              SPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Paypal',
                  image: SImages.paypal,
                ),
              ),
              SizedBox(height: SSizes.spaceBtwItems / 2),
              SPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Paypal',
                  image: SImages.paypal,
                ),
              ),
              SizedBox(height: SSizes.spaceBtwItems / 2),
              SPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Paypal',
                  image: SImages.paypal,
                ),
              ),
              SizedBox(height: SSizes.spaceBtwItems / 2),
              SizedBox(height: SSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}

