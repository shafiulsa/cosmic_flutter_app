import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/views/order/widgets/order_list.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(padding: SPadding.screenPadding, child: SOrderslistItems()),
    ); // Scaffold
  }
}
