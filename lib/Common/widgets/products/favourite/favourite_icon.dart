import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/product/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';



class SFavouriteIcon extends StatelessWidget {
  const SFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
        () => SCircularIcon(
          icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
          color: controller.isFavourite(productId) ? Colors.red : null,
          onPressed: () => controller.toggleFavouriteProduct(productId)),
    );
  }
}
