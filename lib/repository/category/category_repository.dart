import "package:dio/dio.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import 'package:download_portal/config/dio_config.dart';
import "package:download_portal/constants/exception.dart";

import "package:download_portal/models/category/category_model.dart";

final categoryProvider = Provider<CategoryRepositoryApi>((ref) {
  final dioProvider = ref.watch(dio_Config);

  return CategoryRepositoryApi(dioProvider);
});

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategoriesMenu();
}

class CategoryRepositoryApi implements CategoryRepository {
  final Dio dioProvider;

  CategoryRepositoryApi(this.dioProvider);

  @override
  Future<List<CategoryModel>> getCategoriesMenu() async {
    try {
      final result = await dioProvider.get('/categories');

      final categoriesRes = result.data['categories'];

      final List<CategoryModel> categories =
          List.from(categoriesRes.map((item) => CategoryModel.fromJson(item)));

      return categories;
    } on DioError catch (error) {
      // print(error);
      throw DataException.fromDioError(error, error.response?.data['message']);
      // throw error;
    } catch (error) {
      // print(error);
      rethrow;
    }
  }
}
