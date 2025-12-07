
import 'package:e_commerce_app/Common/widgets/custome_shape/primary_header_container.dart';
import 'package:e_commerce_app/Common/widgets/images/user_profile_logo.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constans/sizes.dart';

class SProfilePrimaryHeader extends StatelessWidget {
  const SProfilePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Total height
        SizedBox(height: SSizes.profilePrimaryHeaderHeight + 60),

        //Primary Header
        SPrimaryHeaderContainer(
          child: Container(),
          height: SSizes.profilePrimaryHeaderHeight,
        ),

        //USer Profile
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: UserProfileLogo(),
          ),
        ),
      ],
    );
  }
}

