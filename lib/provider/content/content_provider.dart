import "package:download_portal/models/category/category_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:download_portal/models/api_response/success_response.dart";

import "package:download_portal/models/content/content_model.dart";

import "package:download_portal/repository/content/content_repository.dart";

import "package:download_portal/provider/category/category_provider.dart";

import "package:download_portal/models/common/argument_models.dart";

class CustomContentModel {
  SubCategoryModel subCategory;
  List<ContentModel> contents;

  CustomContentModel({required this.subCategory, required this.contents});
}

final featuredProvider =
    FutureProvider.autoDispose<List<ContentModel>?>((ref) async {
  final data = await ref.read(contentProvider).getFeatured();
  return data;
});

final categoryContentsProvider = FutureProvider.autoDispose
    .family<List<CustomContentModel>?, String>((ref, category) async {
  final categoryItems = ref.watch(categoriesMenuProvider).value;
  List<CustomContentModel> finalData = [];

  final data = await ref.read(contentProvider).getContentsByCategory(category);

  final selectedCat =
      categoryItems!.firstWhere((item) => item.catName == category);

  selectedCat.subCategories?.forEach((item) {
    SubCategoryModel finalSub = item;
    List<ContentModel> finalContents = data
        .where((dataItem) => dataItem.subCatName == item.subCatName)
        .toList();

    finalData.add(
        CustomContentModel(subCategory: finalSub, contents: finalContents));
  });

  return finalData.where((item) => item.contents.isNotEmpty).toList();
});

final subcategoryContentsProvider = FutureProvider.autoDispose
    .family<List<ContentModel>?, CatSubCatModel>((ref, args) async {
  final data = await ref.read(contentProvider).getContentsBySubCategory(args);
  return data;
});

final contentDetailsProvider = FutureProvider.autoDispose
    .family<ContentDetailsModel?, String>((ref, id) async {
  final data = await ref.read(contentProvider).getContentDetails(id);
  return data;
});

// reviews
class ReviewNotifier extends StateNotifier<AsyncValue> {
  final ContentRepositoryApi repository;

  ReviewNotifier({required this.repository})
      : super(const AsyncValue.data(null));

  Future<void> handleWriteReview(Map<String, String> data) async {
    state = const AsyncValue.loading();
    try {
      final result = await repository.createReview(data);

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final reviewNotifierProvider =
    StateNotifierProvider.autoDispose<ReviewNotifier, AsyncValue>((ref) {
  final repository = ref.watch(contentProvider);

  return ReviewNotifier(repository: repository);
});

// comments
class CommentNotifier extends StateNotifier<AsyncValue> {
  final ContentRepositoryApi repository;

  CommentNotifier({required this.repository})
      : super(const AsyncValue.data(null));

  Future<void> handleWriteComment(Map<String, String> data) async {
    state = const AsyncValue.loading();

    try {
      final result = await repository.createComment(data);

      state = AsyncValue.data(result);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final commentNotifierProvider =
    StateNotifierProvider.autoDispose<CommentNotifier, AsyncValue>((ref) {
  final repository = ref.watch(contentProvider);

  return CommentNotifier(repository: repository);
});
