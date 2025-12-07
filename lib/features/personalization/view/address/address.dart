import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/view/address/add_new_address.dart';
import 'package:e_commerce_app/features/personalization/view/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constans/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(
          "Address",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      //--------Body-------
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              SSingleAddress(isSelected: true), // SRoundedContainer
              SizedBox(height: SSizes.spaceBtwItems),
              SSingleAddress(isSelected: false),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    /// -------Floating Action button
     floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(()=>AddNewAddress()),child: Icon(Iconsax.add),backgroundColor: SColors.primary,),
    );
  }
}
