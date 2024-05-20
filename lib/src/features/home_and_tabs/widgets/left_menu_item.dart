import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fairwind/src/common/common.dart';
import 'widgets.dart';
import '../models/models.dart';

class LeftMenuItem extends StatelessWidget {
  const LeftMenuItem({
    required this.leftMenuItemModel,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final LeftMenuItemModel leftMenuItemModel;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.c_blue : Colors.transparent,
          borderRadius: Dimensions.buttonBorderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(leftMenuItemModel.pathToIcon),
            const SizedBox(
              width: Dimensions.app_padding,
            ),
            Text(
              leftMenuItemModel.title,
              style: AppTheme.ts_16_medium_exo2.copyWith(color: isSelected ? AppTheme.c_white : AppTheme.c_text_1),
            ),
          ],
        ),
      ),
    );
  }
}
