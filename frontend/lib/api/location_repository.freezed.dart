// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NameAndLocation _$NameAndLocationFromJson(Map<String, dynamic> json) {
  return _NameAndLocation.fromJson(json);
}

/// @nodoc
mixin _$NameAndLocation {
  String get name => throw _privateConstructorUsedError;
  String get apiId => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameAndLocationCopyWith<NameAndLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameAndLocationCopyWith<$Res> {
  factory $NameAndLocationCopyWith(
          NameAndLocation value, $Res Function(NameAndLocation) then) =
      _$NameAndLocationCopyWithImpl<$Res, NameAndLocation>;
  @useResult
  $Res call({String name, String apiId, double lat, double lng});
}

/// @nodoc
class _$NameAndLocationCopyWithImpl<$Res, $Val extends NameAndLocation>
    implements $NameAndLocationCopyWith<$Res> {
  _$NameAndLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? apiId = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apiId: null == apiId
          ? _value.apiId
          : apiId // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NameAndLocationCopyWith<$Res>
    implements $NameAndLocationCopyWith<$Res> {
  factory _$$_NameAndLocationCopyWith(
          _$_NameAndLocation value, $Res Function(_$_NameAndLocation) then) =
      __$$_NameAndLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String apiId, double lat, double lng});
}

/// @nodoc
class __$$_NameAndLocationCopyWithImpl<$Res>
    extends _$NameAndLocationCopyWithImpl<$Res, _$_NameAndLocation>
    implements _$$_NameAndLocationCopyWith<$Res> {
  __$$_NameAndLocationCopyWithImpl(
      _$_NameAndLocation _value, $Res Function(_$_NameAndLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? apiId = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_NameAndLocation(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apiId: null == apiId
          ? _value.apiId
          : apiId // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NameAndLocation implements _NameAndLocation {
  const _$_NameAndLocation(
      {required this.name,
      required this.apiId,
      required this.lat,
      required this.lng});

  factory _$_NameAndLocation.fromJson(Map<String, dynamic> json) =>
      _$$_NameAndLocationFromJson(json);

  @override
  final String name;
  @override
  final String apiId;
  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'NameAndLocation(name: $name, apiId: $apiId, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameAndLocation &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.apiId, apiId) || other.apiId == apiId) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, apiId, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameAndLocationCopyWith<_$_NameAndLocation> get copyWith =>
      __$$_NameAndLocationCopyWithImpl<_$_NameAndLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NameAndLocationToJson(
      this,
    );
  }
}

abstract class _NameAndLocation implements NameAndLocation {
  const factory _NameAndLocation(
      {required final String name,
      required final String apiId,
      required final double lat,
      required final double lng}) = _$_NameAndLocation;

  factory _NameAndLocation.fromJson(Map<String, dynamic> json) =
      _$_NameAndLocation.fromJson;

  @override
  String get name;
  @override
  String get apiId;
  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_NameAndLocationCopyWith<_$_NameAndLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

EveryonesLocations _$EveryonesLocationsFromJson(Map<String, dynamic> json) {
  return _EveryonesLocations.fromJson(json);
}

/// @nodoc
mixin _$EveryonesLocations {
  List<NameAndLocation> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EveryonesLocationsCopyWith<EveryonesLocations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EveryonesLocationsCopyWith<$Res> {
  factory $EveryonesLocationsCopyWith(
          EveryonesLocations value, $Res Function(EveryonesLocations) then) =
      _$EveryonesLocationsCopyWithImpl<$Res, EveryonesLocations>;
  @useResult
  $Res call({List<NameAndLocation> results});
}

/// @nodoc
class _$EveryonesLocationsCopyWithImpl<$Res, $Val extends EveryonesLocations>
    implements $EveryonesLocationsCopyWith<$Res> {
  _$EveryonesLocationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NameAndLocation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EveryonesLocationsCopyWith<$Res>
    implements $EveryonesLocationsCopyWith<$Res> {
  factory _$$_EveryonesLocationsCopyWith(_$_EveryonesLocations value,
          $Res Function(_$_EveryonesLocations) then) =
      __$$_EveryonesLocationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NameAndLocation> results});
}

/// @nodoc
class __$$_EveryonesLocationsCopyWithImpl<$Res>
    extends _$EveryonesLocationsCopyWithImpl<$Res, _$_EveryonesLocations>
    implements _$$_EveryonesLocationsCopyWith<$Res> {
  __$$_EveryonesLocationsCopyWithImpl(
      _$_EveryonesLocations _value, $Res Function(_$_EveryonesLocations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$_EveryonesLocations(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NameAndLocation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EveryonesLocations implements _EveryonesLocations {
  const _$_EveryonesLocations({required final List<NameAndLocation> results})
      : _results = results;

  factory _$_EveryonesLocations.fromJson(Map<String, dynamic> json) =>
      _$$_EveryonesLocationsFromJson(json);

  final List<NameAndLocation> _results;
  @override
  List<NameAndLocation> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'EveryonesLocations(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EveryonesLocations &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EveryonesLocationsCopyWith<_$_EveryonesLocations> get copyWith =>
      __$$_EveryonesLocationsCopyWithImpl<_$_EveryonesLocations>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EveryonesLocationsToJson(
      this,
    );
  }
}

abstract class _EveryonesLocations implements EveryonesLocations {
  const factory _EveryonesLocations(
      {required final List<NameAndLocation> results}) = _$_EveryonesLocations;

  factory _EveryonesLocations.fromJson(Map<String, dynamic> json) =
      _$_EveryonesLocations.fromJson;

  @override
  List<NameAndLocation> get results;
  @override
  @JsonKey(ignore: true)
  _$$_EveryonesLocationsCopyWith<_$_EveryonesLocations> get copyWith =>
      throw _privateConstructorUsedError;
}
