import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constans/sizes.dart';


class SCategoryShimmer extends StatelessWidget {
  const SCategoryShimmer({super.key, this.itemCount = 6});


  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: SSizes.spaceBtwItems),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              SShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: SSizes.spaceBtwItems / 2),

              /// Text
              SShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
