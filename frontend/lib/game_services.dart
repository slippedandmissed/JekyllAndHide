import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/api/api.dart';
import 'package:localstorage/localstorage.dart';

part 'game_services.freezed.dart';
part 'game_services.g.dart';

class StoredGameCodeService {
  final localStorage = LocalStorage("current-game");

  Future<void> setCode(String? code) async {
    await localStorage.ready;
    if (code == null) {
      localStorage.deleteItem("code");
    } else {
      localStorage.setItem("code", code.toUpperCase());
    }
  }

  Future<String?> get code async {
    await localStorage.ready;
    final storedCode = localStorage.getItem("code") as String?;
    if (storedCode == null) {
      return null;
    }
    return storedCode;
  }
}

@freezed
class GameCodeResponse with _$GameCodeResponse {
  const factory GameCodeResponse({
    required String gameCode,
  }) = _GameCodeResponse;

  factory GameCodeResponse.fromJson(Map<String, Object?> json) =>
      _$GameCodeResponseFromJson(json);
}

class GameRepository {
  final HttpService _http;

  GameRepository({
    required HttpService http,
  }) : _http = http;

  // If you provide `codeOverride`, then we will try to join the game with that
  // code. If you don't provide it, then the game code from
  // `StoredGameCodeService.code` will be used.
  Future<bool> joinGame({String? codeOverride}) async {
    final result = await _http.post(
      "/join-game",
      {},
      (_) => null,
      gameCodeOverride: codeOverride,
    );
    print(result.statusCode);
    return result.statusCode == 200;
  }

  Future<String?> createGame() async {
    final result = await _http.post(
      "/create-game",
      {},
      GameCodeResponse.fromJson,
    );
    return result.result?.gameCode;
  }

  Future<void> quitGame() async {
    await _http.post(
      "/quit-game",
      {},
      (_) => null,
    );
  }
}

final storedGameCodeServiceProvider = Provider((ref) {
  return StoredGameCodeService();
});

final gameRepositoryProvider = Provider((ref) {
  final http = ref.watch(httpProvider);
  return GameRepository(http: http);
});
