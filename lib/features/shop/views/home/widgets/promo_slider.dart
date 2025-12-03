import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/Common/widgets/images/roundes_image.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/features/shop/controllers/banner/banner_controller.dart';
import 'package:e_commerce_app/features/shop/views/home/widgets/banner_dot_navigation.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPromoSlider extends StatelessWidget {
  const SPromoSlider({super.key});



  @override
  Widget build(BuildContext context) {
    final bannerController= Get.put(BannerController());
    return Obx(
        (){
          if(bannerController.isLoading.value){
            return SShimmerEffect(width: double.infinity,height: 190);
          }
          if(bannerController.banners.isEmpty){
            return Text("Banner Not Found");
          }
          return Column(
            children: [
              //Slider
              CarouselSlider(
                items: bannerController.banners.map((banner) => SRoundedImage(imageUrl: banner.imageUrl,isNetworkImage: true,onTap: ()=> Get.toNamed(banner.targetScreen))).toList(),
                options: CarouselOptions(viewportFraction: 1.0,onPageChanged: (index, reason) => bannerController.onPageChange(index)), // CarouselOptions
                carouselController: bannerController.carousalController,
              ),
              SizedBox(height: SSizes.spaceBtwItems),
              BannersDotNavigation(),
            ],
          );
        }
    );
  }
}
