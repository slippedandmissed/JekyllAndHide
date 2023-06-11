import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

const apiUrl = "http://localhost:8000";

class Api {
  final dio = Dio(BaseOptions(baseUrl: apiUrl));
  final localstorage = LocalStorage("api");

  Api();

  Future<String> get apiId async {
    await localstorage.ready;
    final existingId = localstorage.getItem("api_id");
    print("Existing ID: $existingId");
    if (existingId == null) {
      print("Case 1");
      final newId = const Uuid().v4();
      print("New ID: $newId");
      localstorage.setItem("api_id", newId);
      return newId;
    }
    print("Case 2");
    return existingId as String;
  }

  Future<dynamic> get({
    required String path,
    required dynamic data,
  }) async {
    final response = await dio.get(
      path,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*'
        },
      ),
      data: jsonEncode(data),
    );
    if (response.statusCode == null) {
      throw "Null Status Code";
    }
    if (response.statusCode! >= 300 || response.statusCode! < 200) {
      throw response.statusCode!;
    }
    return response.data;
  }

  Future<dynamic> post({
    required String path,
    required dynamic data,
  }) async {
    final response = await dio.post(
      path,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*'
        },
      ),
      data: jsonEncode({
        "data": jsonEncode(data),
        "api_id": await apiId,
      }),
    );
    if (response.statusCode == null) {
      throw "Null Status Code";
    }
    if (response.statusCode! >= 300 || response.statusCode! < 200) {
      throw response.statusCode!;
    }
    return response.data;
  }
}

final apiProvider = Provider((ref) {
  return Api();
});

final apiIdProvider = FutureProvider((ref) async {
  final api = ref.watch(apiProvider);
  return await api.apiId;
});
