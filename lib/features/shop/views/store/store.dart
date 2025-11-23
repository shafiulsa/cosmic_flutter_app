import 'package:e_commerce_app/Common/widgets/appbar/tab_bar.dart';
import 'package:e_commerce_app/Common/widgets/brand/brand_cart.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/views/store/widets/category_tab.dart';
import 'package:e_commerce_app/features/shop/views/store/widets/sotre_primary_header.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 340,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///primary heading
                      SStorePrimaryHeader(),

                      SizedBox(height: SSizes.spaceBtwItems),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SSizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            // barand heading
                            SSectionHeading(
                              title: "Brand",
                              showActionButton: true,
                              onPressed: () {},
                            ),

                            // Brand Card
                            SizedBox(
                              height: SSizes.brandCardHeight,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: SSizes.spaceBtwItems),
                                shrinkWrap: true,
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SBrandCart(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Bottom a ja dibo ta scroll a appbar ar por stack hoya jabe
                bottom: STabBar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Sports")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SCatagoryTab(),
              SCatagoryTab(),
              SCatagoryTab(),
              SCatagoryTab(),
              SCatagoryTab(),
            ],
          ), // TabBarView
        ), // NestedScrollView
      ),
    ); // Scaffold
  }
}
