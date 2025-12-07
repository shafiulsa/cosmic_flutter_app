import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class SElevatedButton extends StatelessWidget {
  const SElevatedButton({
    super.key, required this.onPress, required this.child,
  });
  final VoidCallback onPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SDeviceHelper.getScreenWidth(context),
        child: ElevatedButton(onPressed: onPress, child: child));
  }
}
