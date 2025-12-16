import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/sizes.dart';

class SBillingAddresSection extends StatelessWidget {
  const SBillingAddresSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(AddressController());
    controller.getAllAddress();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// [Text] - Billing Address
        SSectionHeading(
          title: 'Billing Address',
          buttonTitle: 'Change',
          onPressed: () => controller.selectNewAddressBottomSheet(context),
        ),
       Obx((){
        final address= controller.selectedAddress.value;
         if(address.id.isEmpty){
           return Text("Select Address");
         }
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(address.name, style: Theme.of(context).textTheme.bodyLarge),

             Row(
               children: [
                 Icon(Icons.phone, size: SSizes.iconSm, color: SColors.darkGrey),
                 SizedBox(width: SSizes.spaceBtwItems),
                 Text(address.phoneNumber),
               ],
             ), // Row
             SizedBox(height: SSizes.spaceBtwItems / 2),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Icon(
                   Icons.location_history,
                   size: SSizes.iconSm,
                   color: SColors.darkGrey,
                 ),
                 SizedBox(width: SSizes.spaceBtwItems),
                 Expanded(
                   child: Text(
                     address.toString(),
                     softWrap: true,
                   ),
                 ),
               ],
             ), // Row
           ],
         );
       })
      ],
    ); // Column
  }
}
