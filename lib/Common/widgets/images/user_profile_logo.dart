import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constans/images.dart';
import 'circuler_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(() {
      final pic = controller.user.value.profilePicture;

      // Safe check: use default image if empty or invalid URL
      final hasProfilePic = pic.isNotEmpty && pic.startsWith('http');

      //Loading effect
      if(controller.isProfileUploading.value){
        return SShimmerEffect(width: 120,height: 120.0, radius: 120);
      }

      return SCircularImage(
        image: hasProfilePic ? pic : SImages.profileLogo,
        height: 120,
        width: 120.0,
        borderWidth: 5.0,
        padding: 0,
        isNetworkImage: hasProfilePic,
      );
    });
  }
}
