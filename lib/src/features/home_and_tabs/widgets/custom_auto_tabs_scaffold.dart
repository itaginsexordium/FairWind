// Копия AutoTabsScaffold из auto_route, переделанная под наши нужды
// Не совсем изящный способ переделать готовое решение, но в нем планируется
// много изменений

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Signature for a function that takes in [BuildContext] and [TabsRouter]
/// and returns a PreferredSizeWidget usually an AppBar
typedef AppBarBuilder = PreferredSizeWidget Function(
  BuildContext context,
  TabsRouter tabsRouter,
);

/// Signature for a function that takes in [BuildContext] and [TabsRouter]
/// and returns a BottomNavigation Widget
typedef BottomNavigationBuilder = Widget Function(
  BuildContext context,
  TabsRouter tabsRouter,
);

/// Signature for a function that takes in [BuildContext] and [TabsRouter]
/// and returns a LeftNavigationMenu Widget
typedef LeftNavigationMenuBuilder = Widget Function(
  BuildContext context,
  TabsRouter tabsRouter,
);

/// Signature for a function that takes in [BuildContext] and [TabsRouter]
/// and returns a FloatingActionButton Widget or null
typedef FloatingActionButtonBuilder = Widget? Function(
  BuildContext context,
  TabsRouter tabsRouter,
);

/// A scaffold wrapper widget that makes creating an [AutoTabsRouter]
/// much easier and cleaner
class CustomAutoTabsScaffold extends StatelessWidget {
  /// Builds the transition between tabs
  /// defaults to [FadeTransition]
  final AnimatedIndexedStackTransitionBuilder? transitionBuilder;

  /// The List of routes to be used as tabs
  final List<PageRouteInfo> routes;

  /// Duration for each tab-change transition
  final Duration animationDuration;

  /// Curve for each tab-change transition
  final Curve animationCurve;

  /// If this is true routes will only be loaded once navigated to
  final bool lazyLoad;

  /// Builds a BottomNavigation to [Scaffold.bottomNavigation]
  final BottomNavigationBuilder? bottomNavigationBuilder;

  /// Создает левое навигационное меню которое превращается в drawer
  /// при определенной ширине
  final LeftNavigationMenuBuilder? leftNavigationMenuBuilder;

  /// Брейкпоинт при котором левое меню переносится в бургер-меню
  final double? leftMenuCollapseBreakpoint;

  /// The AutoRouteObservers to be used by [AutoTabsRouter]
  final NavigatorObserversBuilder navigatorObservers;

  /// If false [AutoTabsRouter] will not use
  /// the inherited navigators form ancestor routers
  final bool inheritNavigatorObservers;

  /// Passed to [Scaffold.floatingActionButton]
  final Widget? floatingActionButton;

  /// Builds a FloatingActionButton to [Scaffold.floatingActionButton]
  /// unless [floatingActionButton] is provided
  final FloatingActionButtonBuilder? floatingActionButtonBuilder;

  /// Passed to [Scaffold.floatingActionButtonLocation]
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Passed to [Scaffold.floatingActionButtonAnimator]
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// Passed to [Scaffold.persistentFooterButtons]
  final List<Widget>? persistentFooterButtons;

  /// Passed to [Scaffold.drawer]
  final Widget? drawer;

  /// Passed to [Scaffold.onDrawerChanged]
  final DrawerCallback? onDrawerChanged;

  /// Passed to [Scaffold.endDrawer]
  final Widget? endDrawer;

  /// Passed to [Scaffold.onEndDrawerChanged]
  final DrawerCallback? onEndDrawerChanged;

  /// Passed to [Scaffold.drawerScrimColor]
  final Color? drawerScrimColor;

  /// Passed to [Scaffold.backgroundColor]
  final Color? backgroundColor;

  /// Passed to [Scaffold.bottomSheet]
  final Widget? bottomSheet;

  /// Passed to [Scaffold.resizeToAvoidBottomInset]
  final bool? resizeToAvoidBottomInset;

  /// Passed to [Scaffold.primary]
  final bool primary;

  /// Passed to  [Scaffold.drawerDragStartBehavior]
  final DragStartBehavior drawerDragStartBehavior;

  /// Passed to  [Scaffold.drawerEdgeDragWidth]
  final double? drawerEdgeDragWidth;

  /// Passed to  [Scaffold.drawerEnableOpenDragGesture]
  final bool drawerEnableOpenDragGesture;

  /// Passed to  [Scaffold.endDrawerEnableOpenDragGesture]
  final bool endDrawerEnableOpenDragGesture;

  /// Passed to  [Scaffold.restorationId]
  final String? restorationId;

  /// Passed to  [Scaffold.extendBody]
  final bool extendBody;

  /// Passed to  [Scaffold.extendBodyBehindAppBar]
  final bool extendBodyBehindAppBar;

  /// Builds a BottomNavigation to [Scaffold.appBar]
  final AppBarBuilder? appBarBuilder;

  /// Passed to  [Scaffold.scaffoldKey]
  final GlobalKey<ScaffoldState>? scaffoldKey;

  /// Passed to  [Scaffold.  final GlobalKey<ScaffoldState>? scaffoldKey;]

  /// if activeIndex != homeIndex
  /// set activeIndex to homeIndex
  /// else pop parent
  final int homeIndex;

  /// Default constructor;
  const CustomAutoTabsScaffold({
    Key? key,
    required this.routes,
    this.lazyLoad = true,
    this.homeIndex = -1,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.ease,
    this.transitionBuilder,
    this.bottomNavigationBuilder,
    this.leftNavigationMenuBuilder,
    this.leftMenuCollapseBreakpoint,
    this.inheritNavigatorObservers = true,
    this.navigatorObservers =
        AutoRouterDelegate.defaultNavigatorObserversBuilder,
    this.floatingActionButton,
    this.floatingActionButtonBuilder,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.drawerScrimColor,
    this.backgroundColor,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.appBarBuilder,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AutoTabsRouter(
      routes: routes,
      duration: animationDuration,
      lazyLoad: lazyLoad,
      homeIndex: homeIndex,
      navigatorObservers: navigatorObservers,
      inheritNavigatorObservers: inheritNavigatorObservers,
      curve: animationCurve,
      transitionBuilder: (context, child, animation) =>
          transitionBuilder?.call(context, child, animation) ??
          FadeTransition(
            opacity: animation,
            child: child,
          ),
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          endDrawer: endDrawer,
          extendBody: extendBody,
          restorationId: restorationId,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          backgroundColor: backgroundColor,
          drawer: drawer,
          drawerDragStartBehavior: drawerDragStartBehavior,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          drawerScrimColor: drawerScrimColor,
          onDrawerChanged: onDrawerChanged,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          onEndDrawerChanged: onEndDrawerChanged,
          floatingActionButton: floatingActionButton ??
              floatingActionButtonBuilder?.call(context, tabsRouter),
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          floatingActionButtonLocation: floatingActionButtonLocation,
          bottomSheet: bottomSheet,
          persistentFooterButtons: persistentFooterButtons,
          primary: primary,
          appBar: appBarBuilder == null
              ? null
              : appBarBuilder!(
                  context,
                  tabsRouter,
                ),
          // TODO: разместить логику скрытия меню при достижении брейкпоинта
          body: ((leftNavigationMenuBuilder == null) || (width < (leftMenuCollapseBreakpoint ?? double.negativeInfinity)))
              ? child
              : Row(
            children: [
              AnimatedBuilder(
                animation: tabsRouter,
                builder: (_, __) => leftNavigationMenuBuilder!(
                  context,
                  tabsRouter,
                ),
              ),
              Expanded(child: child),
            ],
          ),
          bottomNavigationBar: bottomNavigationBuilder == null
              ? null
              : AnimatedBuilder(
                  animation: tabsRouter,
                  builder: (_, __) => bottomNavigationBuilder!(
                    context,
                    tabsRouter,
                  ),
                ),
        );
      },
    );
  }
}
