// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get creator => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<CommentModel>? get comments => throw _privateConstructorUsedError;
  ReviewRefModel? get ref => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? type,
      String? creator,
      String? description,
      List<CommentModel>? comments,
      ReviewRefModel? ref,
      @JsonKey(fromJson: _dateFromJson) DateTime? createdAt,
      @JsonKey(fromJson: _dateFromJson) DateTime? updatedAt});

  $ReviewRefModelCopyWith<$Res>? get ref;
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? creator = freezed,
    Object? description = freezed,
    Object? comments = freezed,
    Object? ref = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ReviewRefModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewRefModelCopyWith<$Res>? get ref {
    if (_value.ref == null) {
      return null;
    }

    return $ReviewRefModelCopyWith<$Res>(_value.ref!, (value) {
      return _then(_value.copyWith(ref: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$_ReviewModelCopyWith(
          _$_ReviewModel value, $Res Function(_$_ReviewModel) then) =
      __$$_ReviewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? type,
      String? creator,
      String? description,
      List<CommentModel>? comments,
      ReviewRefModel? ref,
      @JsonKey(fromJson: _dateFromJson) DateTime? createdAt,
      @JsonKey(fromJson: _dateFromJson) DateTime? updatedAt});

  @override
  $ReviewRefModelCopyWith<$Res>? get ref;
}

/// @nodoc
class __$$_ReviewModelCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$_ReviewModel>
    implements _$$_ReviewModelCopyWith<$Res> {
  __$$_ReviewModelCopyWithImpl(
      _$_ReviewModel _value, $Res Function(_$_ReviewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? creator = freezed,
    Object? description = freezed,
    Object? comments = freezed,
    Object? ref = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ReviewModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as ReviewRefModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewModel implements _ReviewModel {
  const _$_ReviewModel(
      {@JsonKey(name: "_id") this.id,
      this.type,
      this.creator,
      this.description,
      final List<CommentModel>? comments,
      this.ref,
      @JsonKey(fromJson: _dateFromJson) this.createdAt,
      @JsonKey(fromJson: _dateFromJson) this.updatedAt})
      : _comments = comments;

  factory _$_ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewModelFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? type;
  @override
  final String? creator;
  @override
  final String? description;
  final List<CommentModel>? _comments;
  @override
  List<CommentModel>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ReviewRefModel? ref;
  @override
  @JsonKey(fromJson: _dateFromJson)
  final DateTime? createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ReviewModel(id: $id, type: $type, creator: $creator, description: $description, comments: $comments, ref: $ref, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      creator,
      description,
      const DeepCollectionEquality().hash(_comments),
      ref,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      __$$_ReviewModelCopyWithImpl<_$_ReviewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewModelToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  const factory _ReviewModel(
          {@JsonKey(name: "_id") final String? id,
          final String? type,
          final String? creator,
          final String? description,
          final List<CommentModel>? comments,
          final ReviewRefModel? ref,
          @JsonKey(fromJson: _dateFromJson) final DateTime? createdAt,
          @JsonKey(fromJson: _dateFromJson) final DateTime? updatedAt}) =
      _$_ReviewModel;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$_ReviewModel.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get type;
  @override
  String? get creator;
  @override
  String? get description;
  @override
  List<CommentModel>? get comments;
  @override
  ReviewRefModel? get ref;
  @override
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get creator => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  CommentRefModel? get ref => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? type,
      String? creator,
      String? description,
      CommentRefModel? ref,
      @JsonKey(fromJson: _dateFromJson) DateTime? createdAt});

  $CommentRefModelCopyWith<$Res>? get ref;
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? creator = freezed,
    Object? description = freezed,
    Object? ref = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as CommentRefModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentRefModelCopyWith<$Res>? get ref {
    if (_value.ref == null) {
      return null;
    }

    return $CommentRefModelCopyWith<$Res>(_value.ref!, (value) {
      return _then(_value.copyWith(ref: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$_CommentModelCopyWith(
          _$_CommentModel value, $Res Function(_$_CommentModel) then) =
      __$$_CommentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? type,
      String? creator,
      String? description,
      CommentRefModel? ref,
      @JsonKey(fromJson: _dateFromJson) DateTime? createdAt});

  @override
  $CommentRefModelCopyWith<$Res>? get ref;
}

/// @nodoc
class __$$_CommentModelCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$_CommentModel>
    implements _$$_CommentModelCopyWith<$Res> {
  __$$_CommentModelCopyWithImpl(
      _$_CommentModel _value, $Res Function(_$_CommentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? creator = freezed,
    Object? description = freezed,
    Object? ref = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_CommentModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as CommentRefModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentModel implements _CommentModel {
  const _$_CommentModel(
      {@JsonKey(name: "_id") this.id,
      this.type,
      this.creator,
      this.description,
      this.ref,
      @JsonKey(fromJson: _dateFromJson) this.createdAt});

  factory _$_CommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentModelFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? type;
  @override
  final String? creator;
  @override
  final String? description;
  @override
  final CommentRefModel? ref;
  @override
  @JsonKey(fromJson: _dateFromJson)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CommentModel(id: $id, type: $type, creator: $creator, description: $description, ref: $ref, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, creator, description, ref, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      __$$_CommentModelCopyWithImpl<_$_CommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentModelToJson(
      this,
    );
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel(
          {@JsonKey(name: "_id") final String? id,
          final String? type,
          final String? creator,
          final String? description,
          final CommentRefModel? ref,
          @JsonKey(fromJson: _dateFromJson) final DateTime? createdAt}) =
      _$_CommentModel;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$_CommentModel.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get type;
  @override
  String? get creator;
  @override
  String? get description;
  @override
  CommentRefModel? get ref;
  @override
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentRefModel _$CommentRefModelFromJson(Map<String, dynamic> json) {
  return _CommentRefModel.fromJson(json);
}

/// @nodoc
mixin _$CommentRefModel {
  String? get content => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentRefModelCopyWith<CommentRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentRefModelCopyWith<$Res> {
  factory $CommentRefModelCopyWith(
          CommentRefModel value, $Res Function(CommentRefModel) then) =
      _$CommentRefModelCopyWithImpl<$Res, CommentRefModel>;
  @useResult
  $Res call({String? content, String? user, String? review});
}

/// @nodoc
class _$CommentRefModelCopyWithImpl<$Res, $Val extends CommentRefModel>
    implements $CommentRefModelCopyWith<$Res> {
  _$CommentRefModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? user = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentRefModelCopyWith<$Res>
    implements $CommentRefModelCopyWith<$Res> {
  factory _$$_CommentRefModelCopyWith(
          _$_CommentRefModel value, $Res Function(_$_CommentRefModel) then) =
      __$$_CommentRefModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? content, String? user, String? review});
}

/// @nodoc
class __$$_CommentRefModelCopyWithImpl<$Res>
    extends _$CommentRefModelCopyWithImpl<$Res, _$_CommentRefModel>
    implements _$$_CommentRefModelCopyWith<$Res> {
  __$$_CommentRefModelCopyWithImpl(
      _$_CommentRefModel _value, $Res Function(_$_CommentRefModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? user = freezed,
    Object? review = freezed,
  }) {
    return _then(_$_CommentRefModel(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentRefModel implements _CommentRefModel {
  const _$_CommentRefModel({this.content, this.user, this.review});

  factory _$_CommentRefModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentRefModelFromJson(json);

  @override
  final String? content;
  @override
  final String? user;
  @override
  final String? review;

  @override
  String toString() {
    return 'CommentRefModel(content: $content, user: $user, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentRefModel &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, user, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentRefModelCopyWith<_$_CommentRefModel> get copyWith =>
      __$$_CommentRefModelCopyWithImpl<_$_CommentRefModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentRefModelToJson(
      this,
    );
  }
}

abstract class _CommentRefModel implements CommentRefModel {
  const factory _CommentRefModel(
      {final String? content,
      final String? user,
      final String? review}) = _$_CommentRefModel;

  factory _CommentRefModel.fromJson(Map<String, dynamic> json) =
      _$_CommentRefModel.fromJson;

  @override
  String? get content;
  @override
  String? get user;
  @override
  String? get review;
  @override
  @JsonKey(ignore: true)
  _$$_CommentRefModelCopyWith<_$_CommentRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewRefModel _$ReviewRefModelFromJson(Map<String, dynamic> json) {
  return _ReviewRefModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewRefModel {
  String? get content => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewRefModelCopyWith<ReviewRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewRefModelCopyWith<$Res> {
  factory $ReviewRefModelCopyWith(
          ReviewRefModel value, $Res Function(ReviewRefModel) then) =
      _$ReviewRefModelCopyWithImpl<$Res, ReviewRefModel>;
  @useResult
  $Res call({String? content, String? user});
}

/// @nodoc
class _$ReviewRefModelCopyWithImpl<$Res, $Val extends ReviewRefModel>
    implements $ReviewRefModelCopyWith<$Res> {
  _$ReviewRefModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewRefModelCopyWith<$Res>
    implements $ReviewRefModelCopyWith<$Res> {
  factory _$$_ReviewRefModelCopyWith(
          _$_ReviewRefModel value, $Res Function(_$_ReviewRefModel) then) =
      __$$_ReviewRefModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? content, String? user});
}

/// @nodoc
class __$$_ReviewRefModelCopyWithImpl<$Res>
    extends _$ReviewRefModelCopyWithImpl<$Res, _$_ReviewRefModel>
    implements _$$_ReviewRefModelCopyWith<$Res> {
  __$$_ReviewRefModelCopyWithImpl(
      _$_ReviewRefModel _value, $Res Function(_$_ReviewRefModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_ReviewRefModel(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewRefModel implements _ReviewRefModel {
  const _$_ReviewRefModel({this.content, this.user});

  factory _$_ReviewRefModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewRefModelFromJson(json);

  @override
  final String? content;
  @override
  final String? user;

  @override
  String toString() {
    return 'ReviewRefModel(content: $content, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewRefModel &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewRefModelCopyWith<_$_ReviewRefModel> get copyWith =>
      __$$_ReviewRefModelCopyWithImpl<_$_ReviewRefModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewRefModelToJson(
      this,
    );
  }
}

abstract class _ReviewRefModel implements ReviewRefModel {
  const factory _ReviewRefModel({final String? content, final String? user}) =
      _$_ReviewRefModel;

  factory _ReviewRefModel.fromJson(Map<String, dynamic> json) =
      _$_ReviewRefModel.fromJson;

  @override
  String? get content;
  @override
  String? get user;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewRefModelCopyWith<_$_ReviewRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}
