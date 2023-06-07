import 'package:freezed_annotation/freezed_annotation.dart';

part "argument_models.freezed.dart";

@freezed
abstract class CatSubCatModel with _$CatSubCatModel {
  const factory CatSubCatModel({required String cat, required String sub}) =
      _CatSubCatModel;
}
