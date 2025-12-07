import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/personalization/controllers/change_name_controller.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final controller= Get.put(ChangeNameController());
    return Scaffold(
      //--------Appbar
      appBar: SAppBarr(showBackArrow: true,title: Text('Update name',style: Theme.of(context).textTheme.headlineSmall)),
// // / -----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // // / [Text] - Heading
              Text(
                'Update your name to keep your profile accurate and personalized',
                style: Theme.of(context).textTheme.labelMedium,
              ), // Text
              SizedBox(height: SSizes.spaceBtwSections),
              // // / Form
              Form(
                key: controller.updateUserFormKey,
                child: Column(
                  children: [
                    // // / First Name
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => SValidator.validateEmptyText('First Name', value),
                      decoration: InputDecoration(labelText: SText.firstName, prefixIcon: Icon(Iconsax.user)), // Assuming prefixIcon: Iconsax.user
                    ), // TextFormField
                    SizedBox(height: SSizes.spaceBtwInputFields),
                    // // / Last Name
                    TextFormField(
                        controller: controller.lastName,
                      validator: (value) => SValidator.validateEmptyText('Last Name', value),
                      decoration: InputDecoration(labelText: SText.lastName, prefixIcon: Icon(Iconsax.user)), // Assuming prefixIcon: Iconsax.user
                    ), // TextFormField
                    SizedBox(height: SSizes.spaceBtwSections),
                  ],
                ), // Column
              ),
              SizedBox(height: SSizes.spaceBtwSections),

              SElevatedButton(onPress: controller.updateUserName,child: Text('Save'))
              // Form

            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView



    );
  }
}
