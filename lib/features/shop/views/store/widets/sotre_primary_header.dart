
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce_app/Common/widgets/textfield/serach_bar.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/primary_header_container.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constans/sizes.dart';

class SStorePrimaryHeader extends StatelessWidget {
  const SStorePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.yellow, // Background color
          child: SizedBox(
            height: SSizes.storePrimaryHeaderHeight + 10,
          ),
        ),

        //Primary Header Container
        SPrimaryHeaderContainer(
          height: SSizes.storePrimaryHeaderHeight,
          child: SAppBarr(
            title: Text(
              "store",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [SCartCounterIcon()],
          ),
        ),
        // search bar
        USearchBar(),
      ],
    );
  }
}
