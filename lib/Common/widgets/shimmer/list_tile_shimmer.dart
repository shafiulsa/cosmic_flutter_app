


import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';


class SListTileShimmer extends StatelessWidget {
  const SListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Brand Logo
            SShimmerEffect(width: 50, height: 50, radius: 50,),
            SizedBox(width: SSizes.spaceBtwItems),
            Column(
              children: [
                /// Brand Name
                SShimmerEffect(width: 100, height: 15),
                SizedBox(height: SSizes.spaceBtwItems / 2,),
                /// Brand products
                SShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
