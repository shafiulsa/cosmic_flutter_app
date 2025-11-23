import 'package:flutter/material.dart';

import '../../../utils/constans/sizes.dart';


class SGridLayout extends StatelessWidget {
  const SGridLayout(
      {super.key,
        required this.itemCount,
        this.mainAxisExtent = 295,
        required this.itemBuilder});

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SSizes.gridViewSpacing,
            mainAxisSpacing: SSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
