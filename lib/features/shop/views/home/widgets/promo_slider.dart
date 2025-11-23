import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/Common/widgets/images/roundes_image.dart';
import 'package:e_commerce_app/features/shop/controllers/home/home_controller.dart';
import 'package:e_commerce_app/features/shop/views/home/widgets/banner_dot_navigation.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

class SPromoSlider extends StatelessWidget {
  const SPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller=HomeController.instance;
    return Column(
      children: [
        //Slider
        CarouselSlider(
          items: banners.map((banner) => SRoundedImage(imageUrl: banner)).toList(),
          options: CarouselOptions(viewportFraction: 1.0,onPageChanged: (index, reason) => controller.onPageChange(index)), // CarouselOptions
          carouselController: controller.carousalController,
        ),
        SizedBox(height: SSizes.spaceBtwItems),
        BannersDotNavigation(),
      ],
    );
  }
}
