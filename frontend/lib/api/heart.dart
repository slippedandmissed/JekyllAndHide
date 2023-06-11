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
  final HttpService _http;

  const HeartBeatRepository({required HttpService http}) : _http = http;

  Future<Beat?> heart() async {
    return await _http.get("/heart", {}, Beat.fromJson);
  }
}

final heartBeatRepositoryProvider = Provider((ref) {
  final http = ref.watch(httpProvider);
  return HeartBeatRepository(http: http);
});
