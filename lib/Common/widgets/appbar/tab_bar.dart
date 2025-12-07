
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class STabBar extends StatelessWidget implements PreferredSizeWidget {
  const STabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Material(
      color: dark ? SColors.black : Colors.white,
      child: TabBar(
        isScrollable: true,
        labelColor: dark ? SColors.white : Colors.black,
        unselectedLabelColor: SColors.darkGrey,
        indicatorColor: SColors.primary,
        tabs:
        tabs

        ,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SDeviceHelper.getAppBarHeight());
}
