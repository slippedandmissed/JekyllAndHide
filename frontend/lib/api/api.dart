import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';
import 'package:uuid/uuid.dart';

/// This class provides helpful wrapper methods around HTTP requests,
/// transforming the JSON response data into a strongly-typed object.
/// Note that the provided wrapper methods are designed for use with
/// WebSec, most commonly in automatically generated Repository classes,
/// and conform to WebSec's standards rather than those of a generalised
/// REST framework.
class HttpService {
  /// The HTTP client this wraps.
  final Dio _dio;
  final LocalStorage _localStorage = LocalStorage("api");

  Future<String> get apiId async {
    await _localStorage.ready;
    final existingId = _localStorage.getItem("api_id");
    if (existingId == null) {
      final newId = const Uuid().v4();
      _localStorage.setItem("api_id", newId);
      return newId;
    }
    return existingId as String;
  }

  HttpService(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(onResponse: (e, handler) {
      return handler.next(e);
    }));
  }

  /// The underlying HTTP handler
  Dio get dio => _dio;

  /// Performs a GET request to the specified [path].
  /// The response, if returned with code 200 (OK), is transformed
  /// into an object of type [Res] via the provided [fromJson] method.
  ///
  /// ```dart
  /// UserResponse? data = await httpService.get(
  ///   "/users",
  ///   UserRequest(id: 1),
  ///   UserResponse.fromJson,
  /// );
  /// ```
  Future<Res?> get<Req, Res>(String path, Req input,
      Res Function(Map<String, Object?>) fromJson) async {
    try {
      final response = await _dio.get<Map<String, Object?>>(
        path,
        queryParameters: {
          "json": jsonEncode(input),
          "id": await apiId,
        },
      );
      final data = response.data;
      if (response.statusCode == 200 && data != null) {
        return fromJson(data);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
    }
    return null;
  }

  /// Performs a POST request to the specified [path].
  /// The response, if returned with code 200 (OK), is transformed
  /// into an object of type [Res] via the provided [fromJson] method.
  ///
  /// ```dart
  /// LoginResponse? data = await httpService.post(
  ///   "/login",
  ///   LoginRequest(username, password),
  ///   LoginResponse.fromJson,
  /// );
  /// ```
  Future<Res?> post<Req, Res>(String path, Req input,
      Res Function(Map<String, Object?>) fromJson) async {
    try {
      final response = await _dio.post<Map<String, Object?>>(path,
          data: jsonEncode({
            "json": jsonEncode(input),
            "id": await apiId,
          }));
      final data = response.data;
      if (response.statusCode == 200 && data != null) {
        return fromJson(data);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
    }
    return null;
  }
}

final httpProvider = Provider(
  (ref) {
    String baseUrl;
    if (!kDebugMode) {
      baseUrl = "FIXME: add production database url";
    } else if (!kIsWeb && Platform.isAndroid) {
      baseUrl = "http://10.0.2.2:8000";
    } else {
      baseUrl = "http://localhost:8000";
    }
    return HttpService(
      Dio(
        BaseOptions(baseUrl: baseUrl),
      ),
    );
  },
);

final apiIdProvider = FutureProvider((ref) async {
  final http = ref.watch(httpProvider);
  return await http.apiId;
});
