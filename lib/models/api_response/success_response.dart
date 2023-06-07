import "../../constants/api_response_status_enum.dart";

// models
import "package:download_portal/models/content/content_model.dart";
import "package:download_portal/models/review/review_model.dart";

class SuccessResModel {
  Api_Status_Enum success;
  String message;

  SuccessResModel({required this.success, required this.message});

  factory SuccessResModel.fromJson(Map<String, dynamic> json) =>
      SuccessResModel(success: json['success'], message: json['message']);
}

class ContentDetailsModel {
  ContentModel? content;
  List<ReviewModel>? reviews;

  ContentDetailsModel({required this.content, required this.reviews});

  factory ContentDetailsModel.fromJson(Map<String, dynamic> json) {
    return ContentDetailsModel(
        content: ContentModel.fromJson(json['content']),
        reviews: json['reviews'].isEmpty
            ? []
            : List<ReviewModel>.from(
                json['reviews'].map((data) => ReviewModel.fromJson(data))));
  }
}
