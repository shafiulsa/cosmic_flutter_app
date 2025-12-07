import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/view/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =UserController.instance;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Obx(()=> Text(controller.user.value.fullName)),
      subtitle: Obx(()=> Text(controller.user.value.email)),
      trailing: IconButton(onPressed: ()=>Get.to(()=>EditProfileScreen()), icon: Icon(Icons.edit_off_sharp)),
    );
  }
}
