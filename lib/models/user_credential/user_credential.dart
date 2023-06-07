import 'package:freezed_annotation/freezed_annotation.dart';

part "user_credential.freezed.dart";
part "user_credential.g.dart";

DateTime? _dateFromJson(dynamic date) =>
    date != null ? DateTime.parse(date) : null;
dynamic _dateToJson(DateTime? date) => date?.toIso8601String();

@freezed
class UserCredentialModel with _$UserCredentialModel {
  const factory UserCredentialModel(
      {@JsonKey(name: "_id") String? id,
      MetaModel? meta,
      NameModel? name,
      String? proPic,
      int? mobile,
      String? password,
      String? email,
      StatusModel? status,
      String? accountType,
      ReceiveUpdateModel? receiveUpdate,
      @JsonKey(name: "date") DatesModel? dates,
      int? accountId,
      String? token}) = _UserCredentialModel;

  factory UserCredentialModel.fromJson(Map<String, Object?> json) =>
      _$UserCredentialModelFromJson(json);
}

@freezed
class DatesModel with _$DatesModel {
  const factory DatesModel({
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime? subscribe,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime? signUp,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime? lastSignIn,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
        DateTime? lastActivity,
  }) = _DatesModel;

  factory DatesModel.fromJson(Map<String, Object?> json) =>
      _$DatesModelFromJson(json);
}

@freezed
class ReceiveUpdateModel with _$ReceiveUpdateModel {
  const factory ReceiveUpdateModel({bool? sms, bool? email}) =
      _ReceiveUpdateModel;

  factory ReceiveUpdateModel.fromJson(Map<String, Object?> json) =>
      _$ReceiveUpdateModelFromJson(json);
}

@freezed
class StatusModel with _$StatusModel {
  const factory StatusModel({int? subscriptionStatus, int? accountStatus}) =
      _StatusModel;

  factory StatusModel.fromJson(Map<String, Object?> json) =>
      _$StatusModelFromJson(json);
}

@freezed
class NameModel with _$NameModel {
  const factory NameModel({String? firstName, String? lastName}) = _NameModel;

  factory NameModel.fromJson(Map<String, Object?> json) =>
      _$NameModelFromJson(json);
}

@freezed
class MetaModel with _$MetaModel {
  const factory MetaModel({
    List<String>? downloads,
    List<String>? comments,
    List<ActivityModel>? activities,
    List<String>? reviews,
  }) = _MetaModel;

  factory MetaModel.fromJson(Map<String, Object?> json) =>
      _$MetaModelFromJson(json);
}

@freezed
class ActivityModel with _$ActivityModel {
  const factory ActivityModel(
      {String? id,
      String? userId,
      String? type,
      String? activityRef,
      String? activityDesc,
      @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
          DateTime? createdAt}) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, Object?> json) =>
      _$ActivityModelFromJson(json);
}
// class UserCredentialModel {
//   String? id;
//   MetaModel? meta;
//   NameModel? name;
//   String? proPic;
//   int? mobile;
//   String? password;
//   String? email;
//   StatusModel? status;
//   String? accountType;
//   ReceiveUpdateModel? receiveUpdate;
//   DatesModel? dates;
//   int? accountId;
//   String? token;

//   UserCredentialModel(
//       {this.id,
//       this.meta,
//       this.name,
//       this.proPic,
//       this.mobile,
//       this.password,
//       this.email,
//       this.status,
//       this.accountType,
//       this.receiveUpdate,
//       this.dates,
//       this.accountId,
//       this.token});

//   factory UserCredentialModel.fromJson(Map<String, dynamic> json) {
//     return UserCredentialModel(
//         id: json['_id'],
//         meta: MetaModel.fromJson(json['meta']),
//         name: NameModel.fromJson(json['name']),
//         proPic: json['proPic'],
//         mobile: json['mobile'],
//         password: json['password'],
//         email: json['email'],
//         status: StatusModel.fromJson(json['status']),
//         accountType: json['accountType'],
//         receiveUpdate: ReceiveUpdateModel.fromJson(json['receiveUpdate']),
//         dates: DatesModel.fromJson(json['date']),
//         accountId: json['accountId'],
//         token: json['token']);
//   }

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       "_id": id,
//       "meta": meta?.toJson(),
//       "name": name?.toJson(),
//       "proPic": proPic,
//       "mobile": mobile,
//       "password": password,
//       "email": email,
//       "status": status?.toJson(),
//       "accountType": accountType,
//       "receiveUpdate": receiveUpdate?.toJson(),
//       "date": dates?.toJson(),
//       "accountId": accountId,
//       "token": token
//       // "meta": MetaModel.toMap()
//     };
//   }
// }

// class DatesModel {
//   DateTime? subscribe;
//   DateTime? signUp;
//   DateTime? lastSignIn;
//   DateTime? lastActivity;

//   DatesModel({this.subscribe, this.signUp, this.lastSignIn, this.lastActivity});

//   factory DatesModel.fromJson(Map<String, dynamic> json) {
//     return DatesModel(
//       subscribe: DateTime.parse(json['subscribe']),
//       signUp: DateTime.parse(json['signUp']),
//       lastSignIn: DateTime.parse(json['lastSignIn']),
//       lastActivity: json['lastActivity'] != null
//           ? DateTime.parse(json['lastActivity'])
//           : null,
//     );
//   }

//   Map<String, String?> toJson() {
//     return <String, String?>{
//       "subscribe": subscribe?.toIso8601String(),
//       "signUp": signUp?.toIso8601String(),
//       "lastSignIn": lastSignIn?.toIso8601String(),
//       "lastActivity": lastActivity?.toIso8601String()
//     };
//   }
// }

// class ReceiveUpdateModel {
//   bool? sms;
//   bool? email;

//   ReceiveUpdateModel({required this.sms, required this.email});

//   factory ReceiveUpdateModel.fromJson(Map<String, dynamic> json) {
//     return ReceiveUpdateModel(sms: json['sms'], email: json['email']);
//   }

//   Map<String, bool> toJson() {
//     return {"sms": sms as bool, "email": email as bool};
//   }
// }

// class StatusModel {
//   int? subscriptionStatus;
//   int? accountStatus;

//   StatusModel({this.subscriptionStatus, this.accountStatus});

//   factory StatusModel.fromJson(Map<String, dynamic> json) {
//     return StatusModel(
//         subscriptionStatus: json['subscriptionStatus'],
//         accountStatus: json['accountStatus']);
//   }

//   Map<String, int> toJson() {
//     return <String, int>{
//       "subscriptionStatus": subscriptionStatus as int,
//       "accountStatus": accountStatus as int
//     };
//   }
// }

// class NameModel {
//   String? firstName;
//   String? lastName;

//   NameModel({required this.firstName, required this.lastName});

//   factory NameModel.fromJson(Map<String, dynamic> json) {
//     return NameModel(firstName: json['firstName'], lastName: json['lastName']);
//   }

//   Map<String, String?> toJson() {
//     return <String, String?>{"firstName": firstName, "lastName": lastName};
//   }
// }

// class MetaModel {
//   List<String> downloads;
//   List<String> comments;
//   List<ActivityModel>? activities;
//   List<String> reviews;

//   MetaModel(
//       {required this.downloads,
//       required this.comments,
//       this.activities,
//       required this.reviews});

//   factory MetaModel.fromJson(Map<String, dynamic> json) {
//     List<String> commentList = json['comments'].cast<String>();
//     List<String> downloadList = json['downloads'].cast<String>();
//     List<String> reviewsList = json['reviews'].cast<String>();

//     return MetaModel(
//         downloads: downloadList.isEmpty ? <String>[] : downloadList,
//         comments: commentList.isEmpty ? <String>[] : commentList,
//         activities: json['activities'].isEmpty
//             ? <ActivityModel>[]
//             : List<ActivityModel>.from(
//                 json['activities'].map((data) => ActivityModel.fromJson(data))),
//         reviews: reviewsList.isEmpty ? <String>[] : reviewsList);
//   }

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       "downloads": downloads,
//       "comments": comments,
//       "reviews": reviews,
//       "activities": activities!.isEmpty
//           ? []
//           : List.from(activities!.map((data) => data.toJson()))
//       // "comments"
//     };
//   }
// }

// class ActivityModel {
//   String? id;
//   String? userId;
//   String? type;
//   String? activityRef;
//   String? activityDesc;
//   DateTime? createdAt;

//   ActivityModel(
//       {this.id,
//       this.userId,
//       this.type,
//       this.activityRef,
//       this.activityDesc,
//       this.createdAt});

//   factory ActivityModel.fromJson(Map<String, dynamic> json) {
//     return ActivityModel(
//         id: json['_id'],
//         userId: json['userId'],
//         type: json['type'],
//         activityRef: json['activityRef'],
//         activityDesc: json['activityDesc'],
//         createdAt: DateTime.parse(json['createdAt']));
//   }

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       "_id": id,
//       "userId": userId,
//       "type": type,
//       "activityRef": activityRef,
//       "activityDesc": activityDesc,
//       "createdAt": createdAt?.toIso8601String()
//     };
//   }
// }
