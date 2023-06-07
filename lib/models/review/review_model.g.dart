// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModel _$$_ReviewModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewModel(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      creator: json['creator'] as String?,
      description: json['description'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ref: json['ref'] == null
          ? null
          : ReviewRefModel.fromJson(json['ref'] as Map<String, dynamic>),
      createdAt: _dateFromJson(json['createdAt']),
      updatedAt: _dateFromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_ReviewModelToJson(_$_ReviewModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'creator': instance.creator,
      'description': instance.description,
      'comments': instance.comments,
      'ref': instance.ref,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      creator: json['creator'] as String?,
      description: json['description'] as String?,
      ref: json['ref'] == null
          ? null
          : CommentRefModel.fromJson(json['ref'] as Map<String, dynamic>),
      createdAt: _dateFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'creator': instance.creator,
      'description': instance.description,
      'ref': instance.ref,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$_CommentRefModel _$$_CommentRefModelFromJson(Map<String, dynamic> json) =>
    _$_CommentRefModel(
      content: json['content'] as String?,
      user: json['user'] as String?,
      review: json['review'] as String?,
    );

Map<String, dynamic> _$$_CommentRefModelToJson(_$_CommentRefModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'user': instance.user,
      'review': instance.review,
    };

_$_ReviewRefModel _$$_ReviewRefModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewRefModel(
      content: json['content'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$_ReviewRefModelToJson(_$_ReviewRefModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'user': instance.user,
    };
