import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/Common/widgets/images/user_profile_logo.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileWithEditIcon extends StatelessWidget {
  const UserProfileWithEditIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =UserController.instance;
    return Stack(
      children: [
        // User Profile Logo
        Center(child: UserProfileLogo()),

        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: SCircularIcon(icon: Iconsax.edit,onPressed: controller.updateUserProfilePicture))), // Positioned
      ],
    );
  }
}
