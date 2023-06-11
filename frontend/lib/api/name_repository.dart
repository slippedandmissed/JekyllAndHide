import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/api/api.dart';

class NameRepository {
  final HttpService _http;

  const NameRepository({required HttpService http}) : _http = http;

  Future<void> setName(String name) async {
    await _http.post("/my-name", {"name": name}, (_) => null);
  }
}

final nameRepositoryProvider = Provider((ref) {
  final http = ref.watch(httpProvider);
  return NameRepository(http: http);
});
