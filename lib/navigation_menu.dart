
import 'package:e_commerce_app/features/shop/views/home/home.dart';
import 'package:e_commerce_app/features/shop/views/store/store.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = SHelperFunction.isDarkMode(context);
    final controller=Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? SColors.black : Colors.white,
          indicatorColor: darkMode ? SColors.white.withOpacity(0.1) : SColors.black.withOpacity(0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Icons.heart_broken), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),

    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;


  final screens = [
    HomeScreen(),   // Home
    StoreScreen(),      // Store
    Container(color: Colors.green),     // Wishlist
    Container(color: Colors.purple),    // Profile
  ];



}
