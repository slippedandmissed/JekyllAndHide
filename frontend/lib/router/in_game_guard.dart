import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/game_services.dart';
import 'package:frontend/router/router.dart';

class InGameGuard extends AutoRouteGuard {
  final GameRepository _gameRepository;

  const InGameGuard({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    (() async {
      if (await _gameRepository.joinGame()) {
        resolver.next(true);
      } else {
        resolver.redirect(const JoinRoute());
      }
    })();
  }
}

class OutOfGameGuard extends AutoRouteGuard {
  final GameRepository _gameRepository;

  const OutOfGameGuard({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    (() async {
      if (await _gameRepository.joinGame()) {
        resolver.redirect(const MapRoute());
      } else {
        resolver.next(true);
      }
    })();
  }
}

final inGameGuardProvider = Provider((ref) {
  final gameRepository = ref.watch(gameRepositoryProvider);
  return InGameGuard(gameRepository: gameRepository);
});

final outOfGameGuardProvider = Provider((ref) {
  final gameRepository = ref.watch(gameRepositoryProvider);
  return OutOfGameGuard(gameRepository: gameRepository);
});
