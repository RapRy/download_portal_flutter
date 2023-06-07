import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import '../../config/dio_config.dart';
import "../../constants/exception.dart";
import "../../provider/preference/preference_provider.dart";

// models
import "../../models/user_credential/user_credential.dart";
import "../../models/api_response/success_response.dart";

// constants
import "../../constants/api_response_status_enum.dart";

final authRepository = Provider<AuthRepositoryApi>((ref) {
  final dioProvider = ref.read(dio_Config);
  final preferenceProv = ref.watch(preferenceProvider);
  return AuthRepositoryApi(dioProvider, preferenceProv);
});

abstract class AuthRepository {
  Future<UserCredentialModel> signInApi(Map<String, dynamic> data);
  Future<SuccessResModel> registerToServiceApi(Map<String, String> data);
  Future<SuccessResModel> signUpApi(Map<String, String> data);
}

class AuthRepositoryApi implements AuthRepository {
  final dioProvider;
  final preferenceProvider;

  AuthRepositoryApi(this.dioProvider, this.preferenceProvider);

  @override
  Future<UserCredentialModel> signInApi(Map<String, dynamic> data) async {
    try {
      final result = await dioProvider.post('/users/signin', data: data);
      final Map<String, dynamic> userRes = result.data['user'];
      final String tokenRes = result.data['token'];

      final Map<String, dynamic> finalUserRes = {...userRes, "token": tokenRes};

      final user = UserCredentialModel.fromJson(finalUserRes);

      preferenceProvider.setToString(
          "dl-user-credentials", jsonEncode(user.toJson()));
      return user;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SuccessResModel> registerToServiceApi(Map<String, String> data) async {
    try {
      final result = await dioProvider.post('/users/register', data: data);

      final response = SuccessResModel(
          success: Api_Status_Enum.success, message: result.data['message']);

      return response;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SuccessResModel> signUpApi(Map<String, String> data) async {
    try {
      final result = await dioProvider.post('/users/signup', data: data);

      final response = SuccessResModel(
          success: Api_Status_Enum.success, message: result.data['message']);

      return response;
    } on DioError catch (error) {
      throw DataException.fromDioError(error, error.response?.data['message']);
    } catch (error) {
      rethrow;
    }
  }
}
