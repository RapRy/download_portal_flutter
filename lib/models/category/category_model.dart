import 'package:freezed_annotation/freezed_annotation.dart';

part "category_model.freezed.dart";
part "category_model.g.dart";

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel(
      {@JsonKey(name: "_id") String? id,
      String? catName,
      String? catIcon,
      String? catExt,
      List<SubCategoryModel>? subCategories,
      int? active}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, Object?> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel(
      {@JsonKey(name: "_id") String? id,
      String? parentId,
      String? subCatName,
      String? catName,
      int? active}) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, Object?> json) =>
      _$SubCategoryModelFromJson(json);
}

// class SubCategoryModel {
//   String? id;
//   String? parentId;
//   String? subCatName;
//   String? catName;
//   bool? active;

//   SubCategoryModel(
//       {required this.id,
//       required this.parentId,
//       required this.active,
//       required this.catName,
//       required this.subCatName});

//   factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
//       SubCategoryModel(
//           id: json['_id'],
//           parentId: json['parentId'],
//           active: json['active'] == 1 ? true : false,
//           catName: json['catName'],
//           subCatName: json['subCatName']);
// }
