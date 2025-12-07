
import 'package:e_commerce_app/Common/widgets/custome_shape/clipper/custom_rounded_clipper.dart';
import 'package:flutter/material.dart';


class SRoundedEdges extends StatelessWidget {
  const SRoundedEdges({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SCustomRoundedEdges(),
      child: child,
    );
  }
}
