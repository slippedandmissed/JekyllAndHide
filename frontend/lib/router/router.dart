import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/router/in_game_guard.dart';
import '../dashboard/map.dart';
import '../dashboard/dashboard.dart';
import '../dashboard/teams.dart';
import '../join.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  final InGameGuard _inGameGuard;
  final OutOfGameGuard _outOfGameGuard;

  AppRouter({
    required InGameGuard inGameGuard,
    required OutOfGameGuard outOfGameGuard,
  })  : _inGameGuard = inGameGuard,
        _outOfGameGuard = outOfGameGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: DashboardRoute.page,
          guards: [_inGameGuard],
          children: [
            AutoRoute(path: "", page: MapRoute.page),
            AutoRoute(path: "teams", page: TeamsRoute.page),
          ],
        ),
        AutoRoute(
          path: "/join",
          page: JoinRoute.page,
          guards: [_outOfGameGuard],
        )
      ];
}

final routerProvider = Provider((ref) {
  final inGameGuard = ref.watch(inGameGuardProvider);
  final outofGameGuard = ref.watch(outOfGameGuardProvider);
  return AppRouter(
    inGameGuard: inGameGuard,
    outOfGameGuard: outofGameGuard,
  );
});
