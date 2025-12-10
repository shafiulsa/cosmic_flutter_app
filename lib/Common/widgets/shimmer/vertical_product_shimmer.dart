
import 'package:e_commerce_app/Common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constans/sizes.dart';

class SVerticalProductShimmer extends StatelessWidget {
  const SVerticalProductShimmer({
    super.key,
    this.itemCount = 16
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SGridLayout(
        itemCount: itemCount,
        itemBuilder: (context, index) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              SShimmerEffect(width: 180, height: 180),
              SizedBox(height: SSizes.spaceBtwItems,),

              /// Text
              SShimmerEffect(width: 160, height: 15),
              SizedBox(height: SSizes.spaceBtwItems / 2,),
              SShimmerEffect(width: 110, height: 15)
            ],
          ),
        ),
    );
  }
}
