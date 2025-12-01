import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';

import '../../../utils/constans/images.dart';
import 'circuler_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    bool isProfileAvailable = controller.user.value.profilePicture.isEmpty;
    return SCircularImage(
      image: isProfileAvailable
          ? controller.user.value.profilePicture
          : SImages.profileLogo,
      height: 120,
      width: 120.0,
      borderWidth: 5.0,
      padding: 0,
      isNetworkImage: isProfileAvailable
    );
  }
}
