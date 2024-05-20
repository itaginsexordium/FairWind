import 'package:fairwind/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets.dart';
import '../models/models.dart';

class LeftNavigationMenu extends StatefulWidget {
  const LeftNavigationMenu({required this.tabsRouter, super.key});

  final TabsRouter tabsRouter;

  @override
  State<LeftNavigationMenu> createState() => _LeftNavigationMenuState();
}

class _LeftNavigationMenuState extends State<LeftNavigationMenu> {
  // список имен роутов из которых строится главное меню
  late final List<LeftMenuItemModel> _leftMenuItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _leftMenuItems = widget.tabsRouter.getLeftMenuItems(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.left_navigation_menu_width,
      decoration: const BoxDecoration(
        color: AppTheme.c_white,
        border: Border(
          right: BorderSide(
            width: 1,
            color: AppTheme.c_text_4,
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.app_padding),
        children: [
          const SizedBox(
            height: Dimensions.app_padding,
          ),
          const LeftMenuLogo(),
          const SizedBox(
            height: 2 * Dimensions.app_padding,
          ),
          const MiniMemberProfile(firstName: 'Stan', lastName: 'Kovalsky'),
          const SizedBox(
            height: Dimensions.app_padding,
          ),
          ..._leftMenuItems.asMap().entries.map((entry) {
            int index = entry.key;
            var leftMenuItemModel = entry.value;
            return LeftMenuItem(
              leftMenuItemModel: leftMenuItemModel,
              isSelected: widget.tabsRouter.activeIndex == index,
              onTap: () => widget.tabsRouter.setActiveIndex(index),
            );
          }).toList(),
        ],
      ),
    );
  }
}
