
import 'package:e_commerce_app/Common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/Common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/Common/widgets/textfield/serach_bar.dart';
import 'package:e_commerce_app/features/shop/controllers/home/home_controller.dart';
import 'package:e_commerce_app/features/shop/views/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/views/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/views/home/widgets/home_catagories.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/primary_header_container.dart';
import 'package:e_commerce_app/features/shop/views/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Upper Part
            Stack(
              children: [
                Container(
                  color: Colors.yellow, // Background color
                  child: SizedBox(height: SSizes.homePrimaryHeaderHeight + 10),
                ),
        
                //Primary Header Container
                SPrimaryHeaderContainer(
                  height: SSizes.homePrimaryHeaderHeight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //AppBar
                        SHomeAppBar(),
        
                        // Product Catagory
                        SHomeCatagories(),

                      ],
                    ),
                  ),
                ),
                // search bar
                USearchBar(),
              ],
            ),
            // Lower Part
        
            //Lower part
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  // Banner
                  SPromoSlider(
                    banners: [SImages.homeBanner1,SImages.homeBanner2,SImages.homeBanner3,SImages.homeBanner4,SImages.homeBanner5],
                  ),
                  ///section Heading
                  SizedBox(height: SSizes.spaceBtwItems),
                  SSectionHeading(title: "Populer Products",showActionButton: true,onPressed: ()=>Get.to(()=>AllProductsScreen()),),
                  SizedBox(height: SSizes.spaceBtwItems),

                  /// Vertical Product Card
                 // GridView.builder
                  SGridLayout(
                    itemCount: 6,
                    itemBuilder: (context, index){
                      return SProductCartVertical();
                    },
                  )
        
                ],
              ), // CarouselSlider
            ), // Padding
          ],
        ),
      ),
    );
  }
}


