// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Beat _$BeatFromJson(Map<String, dynamic> json) {
  return _Beat.fromJson(json);
}

/// @nodoc
mixin _$Beat {
  bool get beat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeatCopyWith<Beat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeatCopyWith<$Res> {
  factory $BeatCopyWith(Beat value, $Res Function(Beat) then) =
      _$BeatCopyWithImpl<$Res, Beat>;
  @useResult
  $Res call({bool beat});
}

/// @nodoc
class _$BeatCopyWithImpl<$Res, $Val extends Beat>
    implements $BeatCopyWith<$Res> {
  _$BeatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beat = null,
  }) {
    return _then(_value.copyWith(
      beat: null == beat
          ? _value.beat
          : beat // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeatCopyWith<$Res> implements $BeatCopyWith<$Res> {
  factory _$$_BeatCopyWith(_$_Beat value, $Res Function(_$_Beat) then) =
      __$$_BeatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool beat});
}

/// @nodoc
class __$$_BeatCopyWithImpl<$Res> extends _$BeatCopyWithImpl<$Res, _$_Beat>
    implements _$$_BeatCopyWith<$Res> {
  __$$_BeatCopyWithImpl(_$_Beat _value, $Res Function(_$_Beat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beat = null,
  }) {
    return _then(_$_Beat(
      beat: null == beat
          ? _value.beat
          : beat // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Beat implements _Beat {
  const _$_Beat({required this.beat});

  factory _$_Beat.fromJson(Map<String, dynamic> json) => _$$_BeatFromJson(json);

  @override
  final bool beat;

  @override
  String toString() {
    return 'Beat(beat: $beat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Beat &&
            (identical(other.beat, beat) || other.beat == beat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, beat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeatCopyWith<_$_Beat> get copyWith =>
      __$$_BeatCopyWithImpl<_$_Beat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeatToJson(
      this,
    );
  }
}

abstract class _Beat implements Beat {
  const factory _Beat({required final bool beat}) = _$_Beat;

  factory _Beat.fromJson(Map<String, dynamic> json) = _$_Beat.fromJson;

  @override
  bool get beat;
  @override
  @JsonKey(ignore: true)
  _$$_BeatCopyWith<_$_Beat> get copyWith => throw _privateConstructorUsedError;
}
