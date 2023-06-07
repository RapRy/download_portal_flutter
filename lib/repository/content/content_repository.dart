import "package:dio/dio.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import '../../config/dio_config.dart';
import "../../constants/exception.dart";

import "package:download_portal/models/api_response/success_response.dart";
import "package:download_portal/models/content/content_model.dart";
import "package:download_portal/models/common/argument_models.dart";
import "package:download_portal/models/review/review_model.dart";

final contentProvider = Provider<ContentRepositoryApi>((ref) {
  final dioProvider = ref.watch(dio_Config);

  return ContentRepositoryApi(dioProvider);
});

abstract class ContentRepository {
  Future<List<ContentModel>> getFeatured();
  Future<List<ContentModel>> getContentsByCategory(String category);
  Future<List<ContentModel>> getContentsBySubCategory(CatSubCatModel args);
  Future<ContentDetailsModel> getContentDetails(String id);
  Future<ReviewModel> createReview(Map<String, String> data);
  Future<CommentModel> createComment(Map<String, String> data);
}

class ContentRepositoryApi implements ContentRepository {
  final dioProvider;

  ContentRepositoryApi(this.dioProvider);

  @override
  Future<List<ContentModel>> getFeatured() async {
    try {
      final result = await dioProvider.get('/contents/featured');

      final contentsRes = result.data['contents'];

      final List<ContentModel> contents =
          List.from(contentsRes.map((item) => ContentModel.fromJson(item)));

      return contents;
    } on DioError catch (error) {
      // print(error);
      throw DataException.fromDioError(error, error.response?.data['message']);
      // throw error;
    } catch (error) {
      // print(error);
      rethrow;
    }
  }

  @override
  Future<List<ContentModel>> getContentsByCategory(String category) async {
    try {
      final result = await dioProvider.get('/contents/$category');

      final contentsRes = result.data['data'];

      final List<ContentModel> contents =
          List.from(contentsRes.map((item) => ContentModel.fromJson(item)));

      return contents;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
      // throw error;
    } catch (error) {
      // print(error);
      rethrow;
    }
  }

  @override
  Future<List<ContentModel>> getContentsBySubCategory(
      CatSubCatModel args) async {
    try {
      final String cat = args.cat;
      final String sub = args.sub;

      final result = await dioProvider.get('/contents/$cat/$sub');

      final contentsRes = result.data['data'];

      final List<ContentModel> contents =
          List.from(contentsRes.map((item) => ContentModel.fromJson(item)));

      return contents;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
      // throw error;
    } catch (error) {
      // print(error);
      rethrow;
    }
  }

  @override
  Future<ContentDetailsModel> getContentDetails(String id) async {
    try {
      final result = await dioProvider.get('/contents/details/$id');

      final contentRes = result.data;

      final ContentDetailsModel finalContent =
          ContentDetailsModel.fromJson(contentRes);

      return finalContent;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ReviewModel> createReview(Map<String, String> data) async {
    try {
      final result =
          await dioProvider.post('/reviews/createreview', data: data);

      final review = ReviewModel.fromJson(result.data['review']);

      return review;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CommentModel> createComment(Map<String, String> data) async {
    try {
      final result =
          await dioProvider.post('/comments/createComment', data: data);

      final comment = CommentModel.fromJson(result.data['comment']);

      return comment;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
    } catch (error) {
      rethrow;
    }
  }
}
