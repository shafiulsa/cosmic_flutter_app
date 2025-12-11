
import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';


class SBoxesShimmer extends StatelessWidget {
  const SBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Three Products
            Expanded(child: SShimmerEffect(width: 150, height: 110)),
            SizedBox(width: SSizes.spaceBtwItems),
            Expanded(child: SShimmerEffect(width: 150, height: 110)),
            SizedBox(width: SSizes.spaceBtwItems,),
            Expanded(child: SShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
