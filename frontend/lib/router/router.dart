import 'package:auto_route/auto_route.dart';
import '../dashboard/map.dart';
import '../dashboard/dashboard.dart';
import '../dashboard/teams.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: DashboardRoute.page,
          children: [
            AutoRoute(path: "", page: MapRoute.page),
            AutoRoute(path: "teams", page: TeamsRoute.page),
          ],
        ),
      ];
}
