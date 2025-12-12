import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controlle = Get.put(AddressController());
    return Scaffold(
      // ----appbarr
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      // ----Body
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Form(
            key: controlle.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controlle.name,
                  validator: (value) =>
                      SValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: SSizes.spaceBtwInputFields),

                /// Phone Number
                TextFormField(
                  controller: controlle.phoneNumber,
                  validator: (value) =>
                      SValidator.validateEmptyText('Phone Number', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: SSizes.spaceBtwInputFields),

                /// Postal Code
                Row(
                  children: [
                    /// Street
                    Expanded(
                      child: TextFormField(
                        controller: controlle.street,
                        validator: (value) =>
                            SValidator.validateEmptyText('Street', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    SizedBox(width: SSizes.spaceBtwInputFields),

                    /// Postal Code
                    Expanded(
                      child: TextFormField(
                        controller: controlle.postalCode,
                        validator: (value) =>
                            SValidator.validateEmptyText('Postal Code', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ), // Row
                SizedBox(height: SSizes.spaceBtwInputFields),
                Row(
                  children: [
                    /// Street (This is likely 'City' or 'State' based on context)
                    Expanded(
                      child: TextFormField(
                        controller: controlle.city,
                        validator: (value) =>
                            SValidator.validateEmptyText('City', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(width: SSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controlle.state,
                        validator: (value) =>
                            SValidator.validateEmptyText('State', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State',
                        ),
                      ),
                    ),
                    // Corrected Label based on context
                  ],
                ),
                SizedBox(height: SSizes.spaceBtwInputFields),

                /// Phone Number
                TextFormField(
                  controller: controlle.country,
                  validator: (value) =>
                      SValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global2),
                    labelText: 'Country',
                  ),
                ),
                SizedBox(height: SSizes.spaceBtwSections),

                //Save Button
                SElevatedButton(onPress:controlle.addNewAddress, child: Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
