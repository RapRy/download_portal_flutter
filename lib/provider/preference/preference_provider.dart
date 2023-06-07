import "dart:convert";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../models/user_credential/user_credential.dart";

final sharedPreferenceProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final preferenceProvider = Provider<PreferenceProvider>((ref) {
  final sharedPreferenceWatch = ref.watch(sharedPreferenceProvider);
  return PreferenceProvider(sharedPreferenceWatch);
});

class PreferenceProvider {
  final SharedPreferences _sharedPreference;

  PreferenceProvider(this._sharedPreference);

  Future<bool> setToString(String key, String value) async {
    return await _sharedPreference.setString(key, value);
  }

  UserCredentialModel? getUserCredential() {
    final userFromStorage = _sharedPreference.getString("dl-user-credentials");

    return userFromStorage != null
        ? UserCredentialModel.fromJson(jsonDecode(userFromStorage))
        : null;
  }

  bool hasStorageCredentials() {
    final UserCredentialModel? userCred = getUserCredential();

    if (userCred != null) {
      return true;
    }

    return false;
  }

  String getUserToken() {
    final user = getUserCredential();

    return user != null ? user.token as String : "";
  }
}
