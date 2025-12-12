import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/personalization/models/address_model.dart';
import 'package:e_commerce_app/features/personalization/view/address/add_new_address.dart';
import 'package:e_commerce_app/features/personalization/view/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constans/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

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
          child: Obx(
              ()=> FutureBuilder(
                key: Key(controller.refreshDate.value.toString()),
              future: controller.getAllAddress(),
              builder: (context, snapshot) {
                final widget = SCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                );
                if (widget != null) return widget;

                // Data Found - Addresses Found
                List<AddressModel> address = snapshot.data!;
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: SSizes.spaceBtwItems),
                  itemCount: address.length,
                  itemBuilder: (context, index) {
                    return SSingleAddress(
                        onTap: ()=> controller.selectAddress(address[index]),
                       address: address[index]
                    );
                  }
                );
              },
            ),
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
      /// -------Floating Action button
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddress()),
        child: Icon(Iconsax.add),
        backgroundColor: SColors.primary,
      ),
    );
  }
}
