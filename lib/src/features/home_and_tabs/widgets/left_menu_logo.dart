import 'package:flutter/material.dart';
import 'package:fairwind/src/common/common.dart';

class LeftMenuLogo extends StatelessWidget {
  const LeftMenuLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.logo.logo.image(
          width: 35,
          height: 40,
        ),
        const SizedBox(
          width: Dimensions.app_half_padding,
        ),
        Text(
          S.current.logoTitle,
          style: AppTheme.ts_24_bold_outfit,
        ),
      ],
    );
  }
}
