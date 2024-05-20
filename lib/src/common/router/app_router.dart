import 'package:auto_route/auto_route.dart';
import 'package:fairwind/src/common/common.dart';
import 'package:fairwind/src/common/utils/extensions/router.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: HomeRootRoute.page,
      initial: true,
      children: [
        AutoRoute(
            path: 'main',
            page: MainRoute.page,
            initial: true,
            title: (context, data) => S.current.mainPageTitle,
            meta: {
              'iconPath': Assets.leftMenu.main.path,
            }),
        AutoRoute(
            path: 'finance',
            page: FinanceRoute.page,
            title: (context, data) => S.current.financePageTitle,
            meta: {
              'iconPath': Assets.leftMenu.finance.path,
            }),
        AutoRoute(
            path: 'team',
            page: TeamRoute.page,
            title: (context, data) => S.current.teamPageTitle,
            meta: {
              'iconPath': Assets.leftMenu.team.path,
            }),
        AutoRoute(
            path: 'marketing',
            page: MarketingRoute.page,
            title: (context, data) => S.current.marketingPageTitle,
            meta: {
              'iconPath': Assets.leftMenu.marketing.path,
            }),
        AutoRoute(
            path: 'settings',
            page: SettingsRoute.page,
            title: (context, data) => S.current.settingsPageTitle,
            meta: {
              'iconPath': Assets.leftMenu.settings.path,
            })
      ],
    ),
  ];
}
