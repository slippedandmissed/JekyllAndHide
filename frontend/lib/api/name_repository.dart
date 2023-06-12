import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/api/api.dart';
import 'package:localstorage/localstorage.dart';

class NameRepository {
  final HttpService _http;
  final localStorage = LocalStorage("name");

  NameRepository({required HttpService http}) : _http = http;

  Future<String> get myName async {
    await localStorage.ready;
    return localStorage.getItem("name") as String? ?? "<No Name>";
  }

  Future<void> setName(String name) async {
    await localStorage.ready;
    localStorage.setItem("name", name);
    await _http.post("/my-name", {"name": name}, (_) => null);
  }
}

final nameRepositoryProvider = Provider((ref) {
  final http = ref.watch(httpProvider);
  return NameRepository(http: http);
});

final myNameProvider = FutureProvider((ref) async {
  final nameRepository = ref.watch(nameRepositoryProvider);
  return await nameRepository.myName;
});
