import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/products/sortable_products.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    this.futureMethod,
    this.query,
    required this.title,
  });

  final String title;
  final Future<List<ProductModel>>? futureMethod;
  final Query? query;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        // Assuming style: Theme.of(context).textTheme.headLineMedium
      ), // SAppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {

              const loader = SVerticalProductShimmer();
              final widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
              if (widget != null) return widget;

              List<ProductModel> products = snapshot.data!;
              return SSortAbleProducts(products: products);
            },
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
