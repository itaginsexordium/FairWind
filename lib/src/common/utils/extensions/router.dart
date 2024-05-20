import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fairwind/src/features/home_and_tabs/models/models.dart';


extension TabsRouterExtension on TabsRouter {
  /// получение массива роутов которые имеют тайтл и путь до картинки
  List<LeftMenuItemModel> getLeftMenuItems(BuildContext context) {
    return routeCollection.routes
        .where((route) => (route.title != null)&&(route.meta['iconPath'] != null) )
        .map((route) => LeftMenuItemModel(title: route.title!(context, context.routeData), pathToIcon: route.meta['iconPath'])).toList();
  }
}

extension AutoRouteImageExtension on AutoRoute {
  String? get iconPath {
    return meta['iconPath'] as String?;
  }
}
