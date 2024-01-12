// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat_fact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatFact {
  String get fact => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatFactCopyWith<CatFact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatFactCopyWith<$Res> {
  factory $CatFactCopyWith(CatFact value, $Res Function(CatFact) then) =
      _$CatFactCopyWithImpl<$Res, CatFact>;
  @useResult
  $Res call({String fact});
}

/// @nodoc
class _$CatFactCopyWithImpl<$Res, $Val extends CatFact>
    implements $CatFactCopyWith<$Res> {
  _$CatFactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fact = null,
  }) {
    return _then(_value.copyWith(
      fact: null == fact
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CatFactImplCopyWith<$Res> implements $CatFactCopyWith<$Res> {
  factory _$$CatFactImplCopyWith(
          _$CatFactImpl value, $Res Function(_$CatFactImpl) then) =
      __$$CatFactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fact});
}

/// @nodoc
class __$$CatFactImplCopyWithImpl<$Res>
    extends _$CatFactCopyWithImpl<$Res, _$CatFactImpl>
    implements _$$CatFactImplCopyWith<$Res> {
  __$$CatFactImplCopyWithImpl(
      _$CatFactImpl _value, $Res Function(_$CatFactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fact = null,
  }) {
    return _then(_$CatFactImpl(
      fact: null == fact
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CatFactImpl implements _CatFact {
  const _$CatFactImpl({required this.fact});

  @override
  final String fact;

  @override
  String toString() {
    return 'CatFact(fact: $fact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatFactImpl &&
            (identical(other.fact, fact) || other.fact == fact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatFactImplCopyWith<_$CatFactImpl> get copyWith =>
      __$$CatFactImplCopyWithImpl<_$CatFactImpl>(this, _$identity);
}

abstract class _CatFact implements CatFact {
  const factory _CatFact({required final String fact}) = _$CatFactImpl;

  @override
  String get fact;
  @override
  @JsonKey(ignore: true)
  _$$CatFactImplCopyWith<_$CatFactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
