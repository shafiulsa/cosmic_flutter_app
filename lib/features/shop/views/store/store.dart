import 'package:e_commerce_app/Common/widgets/brand/brand_cart.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/views/store/widets/sotre_primary_header.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              pinned: true,
              floating: true,
              flexibleSpace: SingleChildScrollView(
                child: Column(
                  children: [
                    ///primary heading
                    SStorePrimaryHeader(),
                
                    SizedBox(height: SSizes.spaceBtwItems),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
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
                                separatorBuilder: (context, index) => SizedBox(width: SSizes.spaceBtwItems),
                                shrinkWrap: true,
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>SBrandCart()),
                          )
                
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ), // NestedScrollView
    ); // Scaffold
  }
}

