import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/api/api.dart';

class NameRepository {
  final Api api;

  const NameRepository({required this.api});

  Future<void> setName(String name) async {
    await api.post(path: "/my-name", data: {"name": name});
  }
}

final nameRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiProvider);
  return NameRepository(api: api);
});
