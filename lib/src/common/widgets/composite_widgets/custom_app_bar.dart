import 'package:flutter/material.dart';
import 'package:fairwind/src/common/common.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: прокинуть тени
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppTheme.c_white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Assets.appBar.notification.svg(),
          const SizedBox(
            width: Dimensions.app_padding,
          ),
          Assets.appBar.profile.svg(),
          const SizedBox(
            width: Dimensions.app_padding * 2,
          ),
        ],
      ),
    );
  }
}
