import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/personalization/view/address/address.dart';
import 'package:e_commerce_app/features/personalization/view/profile/widgets/profile_primary_header.dart';
import 'package:e_commerce_app/features/personalization/view/profile/widgets/setting_menu_tile.dart';
import 'package:e_commerce_app/features/personalization/view/profile/widgets/user_profil_tile.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SProfilePrimaryHeader(),
            SizedBox(height: SSizes.spaceBtwItems),

            /// User profile Details
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  SUserProfileTile(),
                  //Account Setting Heading
                  SSectionHeading(
                    title: "Account Setting",
                    showActionButton: false,
                  ),

                  //Settings menue
                  SSettingMenuTile(
                    icon: Icons.home,
                    title: "My Address",
                    subTitle: "this is beautifuke",
                    onTap: () => Get.to(() => AddressScreen()),
                  ),
                  SSettingMenuTile(
                    icon: Icons.local_printshop_outlined,
                    title: "My Address",
                    subTitle: "this is beautifuke",
                    onTap: () {},
                  ),
                  SSettingMenuTile(
                    icon: Icons.accessibility_rounded,
                    title: "My Address",
                    subTitle: "this is beautifuke",
                    onTap: () {},
                  ),
                  SizedBox(height: SSizes.spaceBtwSections),

                  /// Logout
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Log Out"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
