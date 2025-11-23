import 'package:flutter/material.dart';

import '../../../utils/constans/images.dart';
import 'circuler_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SCircularImage(
      image: SImages.profileLogo,
      height: 120,
      width: 120.0,
      borderWidth: 5.0,
      padding: 0,
    );
  }
}
