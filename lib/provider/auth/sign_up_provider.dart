import "package:flutter_riverpod/flutter_riverpod.dart";

// repository
import "../../repository/auth/auth_repository.dart";

// models
import "../../models/api_response/success_response.dart";

// constants
import "../../constants/api_response_status_enum.dart";

class SignUpNotifier extends StateNotifier<AsyncValue<SuccessResModel?>> {
  final AuthRepository repository;

  SignUpNotifier({required this.repository})
      : super(AsyncValue.data(
            SuccessResModel(success: Api_Status_Enum.idle, message: "")));

  Future<void> signUp(Map<String, String> data) async {
    state = const AsyncValue.loading();

    try {
      final response = await repository.signUpApi(data);

      state = AsyncValue.data(response);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final signUpNotifierProvider = StateNotifierProvider.autoDispose<SignUpNotifier,
    AsyncValue<SuccessResModel?>>((ref) {
  final repository = ref.watch(authRepository);

  return SignUpNotifier(repository: repository);
});
