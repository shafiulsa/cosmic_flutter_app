import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/view/change_name/change_name.dart';
import 'package:e_commerce_app/features/personalization/view/edit_profile/widgets/user_profile_with_user_icon.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =UserController.instance;
    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              // User Profile with edit icon
              UserProfileWithEditIcon(), // Stack
              SizedBox(height: SSizes.spaceBtwSections),

              /// Divider
              Divider(),

              SizedBox(height: SSizes.spaceBtwItems),

              /// Account Settings Heading
              SSectionHeading(title: 'Account Settings'),
              SizedBox(height: SSizes.spaceBtwItems),

              UserDetailsRow(title: "name", value: controller.user.value.fullName,onTap: ()=>Get.to(()=>ChangeNameScreen())), // Row
              UserDetailsRow(title: "Usrname", value: controller.user.value.username,onTap: (){}), // Row

              /// Divider
              Divider(),
              SizedBox(height: SSizes.spaceBtwItems),

              // Profile Section Heading
              SSectionHeading(title: 'Account Settings' ,showActionButton: false,),
              UserDetailsRow(title: "name", value: controller.user.value.email,onTap: (){}), // Row
              UserDetailsRow(title: "Phone", value: "+880 ${controller.user.value.phoneNumber}",onTap: (){}), // Row
              Divider(),
              SizedBox(height: SSizes.spaceBtwItems),
              
              TextButton(onPressed: (){}, child: Text("Close Account" ,style: TextStyle(color: Colors.red)))


            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailsRow extends StatelessWidget {
  const UserDetailsRow({
    super.key,
    required this.title,
    required this.value,
     this.icon=Iconsax.arrow_right, required this.onTap,
  });

  final String title, value;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ), // Expanded
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(Iconsax.arrow_right_34, size: SSizes.iconSm)),
          ],
        ),
      ),
    );
  }
}
