import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/Common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/Common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/Common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/product/favourite_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteController = Get.put(FavouriteController());
    return Scaffold(
      appBar: SAppBarr(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          SCircularIcon(
            icon: Icons.add,
            onPressed: () =>
                NavigationController.intance.selectedIndex.value = 0,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),

          child: Obx(
            () => FutureBuilder(
              future: FavouriteController.instance.getFavouriteProducts(),
              builder: (context, snapshot) {
                final nothingFound = SAnimationLoader(
                  text: 'Wishlist is Empty...',
                  animation: SImages.pencilAnimation,
                  showActionButton: true,
                  actionText: "Let's add some",
                  onPressed: () => NavigationController.intance.selectedIndex.value = 0,
                ); // SAnimationLoader;
                const loader = SVerticalProductShimmer(itemCount: 6);
                // Handle Empty Data, Loading And Error
                final widget = SCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: nothingFound,
                );
                if (widget != null) return widget;

                // Products Found
                List<ProductModel> products = snapshot.data!;

                return SGridLayout(
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      SProductCartVertical(product: products[index]),
                );
              },
            ), // FutureBuilder
          ), // Obx
        ),
      ),
    );
  }
}
