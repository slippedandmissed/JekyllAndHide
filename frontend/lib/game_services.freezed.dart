// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_services.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameCodeResponse _$GameCodeResponseFromJson(Map<String, dynamic> json) {
  return _GameCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$GameCodeResponse {
  String get gameCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCodeResponseCopyWith<GameCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCodeResponseCopyWith<$Res> {
  factory $GameCodeResponseCopyWith(
          GameCodeResponse value, $Res Function(GameCodeResponse) then) =
      _$GameCodeResponseCopyWithImpl<$Res, GameCodeResponse>;
  @useResult
  $Res call({String gameCode});
}

/// @nodoc
class _$GameCodeResponseCopyWithImpl<$Res, $Val extends GameCodeResponse>
    implements $GameCodeResponseCopyWith<$Res> {
  _$GameCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameCode = null,
  }) {
    return _then(_value.copyWith(
      gameCode: null == gameCode
          ? _value.gameCode
          : gameCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameCodeResponseCopyWith<$Res>
    implements $GameCodeResponseCopyWith<$Res> {
  factory _$$_GameCodeResponseCopyWith(
          _$_GameCodeResponse value, $Res Function(_$_GameCodeResponse) then) =
      __$$_GameCodeResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String gameCode});
}

/// @nodoc
class __$$_GameCodeResponseCopyWithImpl<$Res>
    extends _$GameCodeResponseCopyWithImpl<$Res, _$_GameCodeResponse>
    implements _$$_GameCodeResponseCopyWith<$Res> {
  __$$_GameCodeResponseCopyWithImpl(
      _$_GameCodeResponse _value, $Res Function(_$_GameCodeResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameCode = null,
  }) {
    return _then(_$_GameCodeResponse(
      gameCode: null == gameCode
          ? _value.gameCode
          : gameCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameCodeResponse implements _GameCodeResponse {
  const _$_GameCodeResponse({required this.gameCode});

  factory _$_GameCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GameCodeResponseFromJson(json);

  @override
  final String gameCode;

  @override
  String toString() {
    return 'GameCodeResponse(gameCode: $gameCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameCodeResponse &&
            (identical(other.gameCode, gameCode) ||
                other.gameCode == gameCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameCodeResponseCopyWith<_$_GameCodeResponse> get copyWith =>
      __$$_GameCodeResponseCopyWithImpl<_$_GameCodeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameCodeResponseToJson(
      this,
    );
  }
}

abstract class _GameCodeResponse implements GameCodeResponse {
  const factory _GameCodeResponse({required final String gameCode}) =
      _$_GameCodeResponse;

  factory _GameCodeResponse.fromJson(Map<String, dynamic> json) =
      _$_GameCodeResponse.fromJson;

  @override
  String get gameCode;
  @override
  @JsonKey(ignore: true)
  _$$_GameCodeResponseCopyWith<_$_GameCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
