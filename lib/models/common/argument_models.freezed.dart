// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'argument_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatSubCatModel {
  String get cat => throw _privateConstructorUsedError;
  String get sub => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatSubCatModelCopyWith<CatSubCatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatSubCatModelCopyWith<$Res> {
  factory $CatSubCatModelCopyWith(
          CatSubCatModel value, $Res Function(CatSubCatModel) then) =
      _$CatSubCatModelCopyWithImpl<$Res, CatSubCatModel>;
  @useResult
  $Res call({String cat, String sub});
}

/// @nodoc
class _$CatSubCatModelCopyWithImpl<$Res, $Val extends CatSubCatModel>
    implements $CatSubCatModelCopyWith<$Res> {
  _$CatSubCatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cat = null,
    Object? sub = null,
  }) {
    return _then(_value.copyWith(
      cat: null == cat
          ? _value.cat
          : cat // ignore: cast_nullable_to_non_nullable
              as String,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CatSubCatModelCopyWith<$Res>
    implements $CatSubCatModelCopyWith<$Res> {
  factory _$$_CatSubCatModelCopyWith(
          _$_CatSubCatModel value, $Res Function(_$_CatSubCatModel) then) =
      __$$_CatSubCatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cat, String sub});
}

/// @nodoc
class __$$_CatSubCatModelCopyWithImpl<$Res>
    extends _$CatSubCatModelCopyWithImpl<$Res, _$_CatSubCatModel>
    implements _$$_CatSubCatModelCopyWith<$Res> {
  __$$_CatSubCatModelCopyWithImpl(
      _$_CatSubCatModel _value, $Res Function(_$_CatSubCatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cat = null,
    Object? sub = null,
  }) {
    return _then(_$_CatSubCatModel(
      cat: null == cat
          ? _value.cat
          : cat // ignore: cast_nullable_to_non_nullable
              as String,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CatSubCatModel implements _CatSubCatModel {
  const _$_CatSubCatModel({required this.cat, required this.sub});

  @override
  final String cat;
  @override
  final String sub;

  @override
  String toString() {
    return 'CatSubCatModel(cat: $cat, sub: $sub)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatSubCatModel &&
            (identical(other.cat, cat) || other.cat == cat) &&
            (identical(other.sub, sub) || other.sub == sub));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cat, sub);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CatSubCatModelCopyWith<_$_CatSubCatModel> get copyWith =>
      __$$_CatSubCatModelCopyWithImpl<_$_CatSubCatModel>(this, _$identity);
}

abstract class _CatSubCatModel implements CatSubCatModel {
  const factory _CatSubCatModel(
      {required final String cat,
      required final String sub}) = _$_CatSubCatModel;

  @override
  String get cat;
  @override
  String get sub;
  @override
  @JsonKey(ignore: true)
  _$$_CatSubCatModelCopyWith<_$_CatSubCatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
