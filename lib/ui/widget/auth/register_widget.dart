import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

// widgets
import "../../widget/common/textfield_widget.dart";
import "../../widget/common/button_widget.dart";

// model
import "../../../models/api_response/success_response.dart";

// provider
import "../../../provider/auth/register_provider.dart";

class RegisterWidget extends ConsumerStatefulWidget {
  const RegisterWidget({super.key});

  @override
  RegisterWidgetState createState() => RegisterWidgetState();
}

class RegisterWidgetState extends ConsumerState<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();
  FocusNode mobileNumberFocus = FocusNode();

  void _handleRegister() {
    ref
        .read(registerNotifierProvider.notifier)
        .register({"mobile": mobileNumber.text});
  }

  @override
  void dispose() {
    mobileNumberFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerValue = ref.watch(registerNotifierProvider);

    ref.listen<AsyncValue<SuccessResModel?>>(registerNotifierProvider,
        (_, AsyncValue<SuccessResModel?> nextState) {
      if (nextState.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(nextState.error.toString()),
          backgroundColor: Colors.red,
        ));
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(nextState.value?.message as String),
        backgroundColor: const Color.fromRGBO(146, 220, 126, 1),
      ));
      mobileNumber.clear();
      return;
    });

    return Column(children: [
      Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("REGISTER TO OUR SERVICE",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium)),
      const SizedBox(
        height: 20,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          "You need to register to our service before you sign up. If you’re already registered just fill up the sign up form below.",
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                    controller: mobileNumber,
                    isPassword: false,
                    currentInput: mobileNumberFocus,
                    label: "Mobile number:",
                    nextInput: null,
                    disable: registerValue.isLoading,
                    keyboardType: TextInputType.number,
                    submitForm: _handleRegister),
                const SizedBox(
                  height: 20,
                ),
                registerValue.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(146, 220, 126, 1)),
                      ))
                    : CustomButtonWithIcon(
                        icon: Icons.login,
                        isLoading: registerValue.isLoading,
                        label: "REGISTER",
                        onPressEvent: _handleRegister),
              ],
            )),
      ),
      const SizedBox(
        height: 40,
      ),
    ]);
  }
}
