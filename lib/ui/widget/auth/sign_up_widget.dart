import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

// widgets
import "../../widget/common/textfield_widget.dart";
import "../../widget/common/button_widget.dart";

// model
import "../../../models/api_response/success_response.dart";

// provider
import "../../../provider/auth/sign_up_provider.dart";

class SignUpWidget extends ConsumerStatefulWidget {
  const SignUpWidget({super.key});

  @override
  SignUpWidgetState createState() => SignUpWidgetState();
}

class SignUpWidgetState extends ConsumerState<SignUpWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode mobileNumberFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  void _handleSignUp() {
    ref.read(signUpNotifierProvider.notifier).signUp({
      "mobile": mobileNumberController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "email": emailController.text,
      "confirmPassword": confirmPasswordController.text
    });
  }

  @override
  void dispose() {
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    mobileNumberFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpValue = ref.watch(signUpNotifierProvider);

    ref.listen<AsyncValue<SuccessResModel?>>(signUpNotifierProvider,
        (_, AsyncValue<SuccessResModel?> nextState) {
      if (nextState.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(nextState.error.toString()),
          backgroundColor: Colors.red,
        ));
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "You have succesfully created your account. You can now proceed to SIGN IN your account."),
        backgroundColor: Color.fromRGBO(146, 220, 126, 1),
      ));
      mobileNumberController.clear();
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      Navigator.of(context).pop();
      return;
    });

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Text("CREATE ACCOUNT",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium)),
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
                        controller: firstNameController,
                        isPassword: false,
                        currentInput: firstNameFocus,
                        label: "First name:",
                        nextInput: lastNameFocus,
                        disable: signUpValue.isLoading,
                        keyboardType: TextInputType.text,
                        submitForm: null),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: lastNameController,
                        isPassword: false,
                        currentInput: lastNameFocus,
                        label: "Last name:",
                        nextInput: mobileNumberFocus,
                        disable: signUpValue.isLoading,
                        keyboardType: TextInputType.text,
                        submitForm: null),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: mobileNumberController,
                        isPassword: false,
                        currentInput: mobileNumberFocus,
                        label: "Mobile number:",
                        nextInput: emailFocus,
                        disable: signUpValue.isLoading,
                        keyboardType: TextInputType.number,
                        submitForm: null),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: emailController,
                        isPassword: false,
                        currentInput: emailFocus,
                        label: "Email:",
                        nextInput: passwordFocus,
                        disable: signUpValue.isLoading,
                        keyboardType: TextInputType.emailAddress,
                        submitForm: null),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: passwordController,
                        isPassword: true,
                        currentInput: passwordFocus,
                        label: "Password:",
                        nextInput: confirmPasswordFocus,
                        disable: signUpValue.isLoading,
                        keyboardType: TextInputType.text,
                        submitForm: null),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: confirmPasswordController,
                        isPassword: true,
                        currentInput: confirmPasswordFocus,
                        label: "Confirm password:",
                        nextInput: null,
                        disable: signUpValue.isLoading,
                        keyboardType: TextInputType.text,
                        submitForm: _handleSignUp),
                    const SizedBox(
                      height: 20,
                    ),
                    signUpValue.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(146, 220, 126, 1)),
                          ))
                        : CustomButtonWithIcon(
                            icon: Icons.login,
                            isLoading: false,
                            label: "SIGN UP",
                            onPressEvent: _handleSignUp),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )))
      ],
    );
  }
}
