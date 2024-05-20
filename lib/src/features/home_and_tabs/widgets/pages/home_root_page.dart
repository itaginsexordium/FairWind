import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fairwind/src/common/common.dart';
import '../widgets.dart';

@RoutePage()
class HomeRootPage extends StatelessWidget {
  const HomeRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomAutoTabsScaffold(
        routes: const [
          MainRoute(),
          FinanceRoute(),
          TeamRoute(),
          MarketingRoute(),
          SettingsRoute()
        ],
        backgroundColor: AppTheme.c_background,

        leftMenuCollapseBreakpoint: BreakPoints.leftMenuCollapseBreakpoint,
        leftNavigationMenuBuilder: (context, tabsRouter) {
          return LeftNavigationMenu(tabsRouter: tabsRouter);
        },
      ),
    );
  }
}
