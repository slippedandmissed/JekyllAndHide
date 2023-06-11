import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/api/api.dart';

part 'heart.freezed.dart';
part 'heart.g.dart';

@freezed
class Beat with _$Beat {
  const factory Beat({
    required bool beat,
  }) = _Beat;

  factory Beat.fromJson(Map<String, Object?> json) => _$BeatFromJson(json);
}

class HeartBeatRepository {
  final Api api;

  const HeartBeatRepository({required this.api});

  Future<Beat> heart() async {
    final response = await api.get(path: "/heart", data: {});
    return Beat.fromJson(response);
  }
}

final heartBeatRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiProvider);
  return HeartBeatRepository(api: api);
});
