import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SAppBarr extends StatelessWidget implements PreferredSizeWidget {
  const SAppBarr({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        // leading: showBackArrow
        //     ? IconButton(
        //   onPressed: () => Get.back(),
        //   icon: Icon(Icons.arrow_back),
        // )
        //     : leadingIcon != null
        //     ? IconButton(
        //   onPressed: leadingOnPressed,
        //   icon: Icon(leadingIcon),
        //   color: dark ? SColors.light : SColors.black,
        // )
        //     : null,
        leading: showBackArrow
            ? IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: dark ? SColors.light : SColors.dark,   // <-- ADD THIS
          ),
        )
            : leadingIcon != null
            ? IconButton(
          onPressed: leadingOnPressed,
          icon: Icon(
            leadingIcon,
            color: dark ? SColors.light : SColors.dark,
          ),
        )
            : null,

        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SDeviceHelper.getAppBarHeight());
}
