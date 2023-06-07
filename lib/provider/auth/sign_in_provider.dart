import "package:flutter_riverpod/flutter_riverpod.dart";

// provider
import "../../provider/preference/preference_provider.dart";

// models
import "../../models/user_credential/user_credential.dart";

// repository
import "../../repository/auth/auth_repository.dart";

class SignInNotifier extends StateNotifier<AsyncValue<UserCredentialModel?>> {
  final AuthRepositoryApi repository;
  final PreferenceProvider prefProvider;

  SignInNotifier({required this.repository, required this.prefProvider})
      : super(const AsyncValue.data(null));

  Future<void> singIn(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final user = await repository.signInApi(data);
      // print(user);
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final signInNotifierProvider = StateNotifierProvider.autoDispose<SignInNotifier,
    AsyncValue<UserCredentialModel?>>((ref) {
  final repository = ref.watch(authRepository);
  final prefProvider = ref.watch(preferenceProvider);

  return SignInNotifier(repository: repository, prefProvider: prefProvider);
});
