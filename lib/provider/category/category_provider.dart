import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:download_portal/models/category/category_model.dart";

import "package:download_portal/repository/category/category_repository.dart";

final categoriesMenuProvider =
    FutureProvider.autoDispose<List<CategoryModel>>((ref) async {
  final data = ref.watch(categoryProvider).getCategoriesMenu();
  return data;
});
