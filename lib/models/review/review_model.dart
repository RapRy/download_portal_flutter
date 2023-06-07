import 'package:freezed_annotation/freezed_annotation.dart';

part "review_model.freezed.dart";
part "review_model.g.dart";

DateTime? _dateFromJson(dynamic date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    @JsonKey(name: "_id") String? id,
    String? type,
    String? creator,
    String? description,
    List<CommentModel>? comments,
    ReviewRefModel? ref,
    @JsonKey(fromJson: _dateFromJson) DateTime? createdAt,
    @JsonKey(fromJson: _dateFromJson) DateTime? updatedAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, Object?> json) =>
      _$ReviewModelFromJson(json);
}

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel(
      {@JsonKey(name: "_id") String? id,
      String? type,
      String? creator,
      String? description,
      CommentRefModel? ref,
      @JsonKey(fromJson: _dateFromJson) DateTime? createdAt}) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class CommentRefModel with _$CommentRefModel {
  const factory CommentRefModel({
    String? content,
    String? user,
    String? review,
  }) = _CommentRefModel;

  factory CommentRefModel.fromJson(Map<String, Object?> json) =>
      _$CommentRefModelFromJson(json);
}

@freezed
class ReviewRefModel with _$ReviewRefModel {
  const factory ReviewRefModel({
    String? content,
    String? user,
  }) = _ReviewRefModel;

  factory ReviewRefModel.fromJson(Map<String, Object?> json) =>
      _$ReviewRefModelFromJson(json);
}
