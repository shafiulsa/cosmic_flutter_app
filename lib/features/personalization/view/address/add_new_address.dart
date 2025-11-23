import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: SSizes.spaceBtwInputFields),

              /// Phone Number
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: SSizes.spaceBtwInputFields),
              /// Postal Code
              Row(
                children: [
                  /// Street
                  Expanded(
                    child: TextFormField(
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: 'City',
                      ),
                    ),
                  ),
                  SizedBox(width: SSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
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
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.global2),
                  labelText: 'Country',
                ),
              ),
              SizedBox(height: SSizes.spaceBtwSections),
              //Save Button

              SElevatedButton(onPress: () {}, child: Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
