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
    return Obx(
        (){
        // bool isProfileAvailable = controller.user.value.profilePicture.isEmpty;
        //
        //   return SCircularImage(
        //       image: isProfileAvailable
        //           ? controller.user.value.profilePicture
        //           : SImages.profileLogo,
        //
        //       height: 120,
        //       width: 120.0,
        //       borderWidth: 5.0,
        //       padding: 0,
        //       isNetworkImage: isProfileAvailable
        //
        //   );



        //   final pic = controller.user.value.profilePicture;
        //
        //   bool hasProfilePic = controller.user.value.profilePicture.isNotEmpty;
        //
        //   return SCircularImage(
        //     image: hasProfilePic ? controller.user.value.profilePicture : SImages.profileLogo,
        //     height: 120,
        //     width: 120.0,
        //     borderWidth: 5.0,
        //     padding: 0,
        //     isNetworkImage: hasProfilePic,
        //   );



          final pic = controller.user.value.profilePicture;

          // Safe check: use default image if empty or invalid URL
          final hasProfilePic = pic.isNotEmpty && pic.startsWith('http');

          return SCircularImage(
            image: hasProfilePic ? pic : SImages.profileLogo,
            height: 120,
            width: 120.0,
            borderWidth: 5.0,
            padding: 0,
            isNetworkImage: hasProfilePic,
          );

        }
    );
  }
}
