import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

// providers
import '../../../provider/auth/sign_in_provider.dart';

import '../../../models/user_credential/user_credential.dart';

// screens | routes
import "./sign_up_screen.dart";
import 'package:download_portal/ui/screens/home/home.dart';

// widgets
import "../../widget/common/textfield_widget.dart";
import "../../widget/common/button_widget.dart";
import 'package:download_portal/ui/widget/common/avatar_heading_widget.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});
  static const routeName = "/sign-in";

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<SignInScreen> {
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode mobileNumberFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  void _handleLoginBtn() {
    ref.read(signInNotifierProvider.notifier).singIn({
      "mobile": mobileNumController.text,
      "password": passwordController.text
    });
    // print(_formKey.currentState.save());
  }

  @override
  void dispose() {
    passwordFocus.dispose();
    mobileNumberFocus.dispose();
    mobileNumController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    ref.listen<AsyncValue<UserCredentialModel?>>(signInNotifierProvider,
        (_, state) {
      if (state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
          ),
        );
      }

      if (state.hasValue) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Home()));
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const AvatarHeadingWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text('Subscriber Login'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(children: [
                CustomTextField(
                    controller: mobileNumController,
                    isPassword: false,
                    currentInput: mobileNumberFocus,
                    label: "Mobile number:",
                    nextInput: passwordFocus,
                    disable: signInProvider.isLoading,
                    keyboardType: TextInputType.number,
                    submitForm: null),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    currentInput: passwordFocus,
                    label: "Password:",
                    nextInput: null,
                    disable: signInProvider.isLoading,
                    keyboardType: TextInputType.text,
                    submitForm: () => _handleLoginBtn()),
                const SizedBox(
                  height: 20,
                ),
                signInProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(146, 220, 126, 1)),
                      ))
                    : CustomButtonWithIcon(
                        icon: Icons.login,
                        isLoading: signInProvider.isLoading,
                        label: "SIGN IN",
                        onPressEvent: _handleLoginBtn),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        style: const TextStyle(fontSize: 15),
                        text:
                            "New here or already registered but does’nt have an account yet? ",
                        children: <InlineSpan>[
                          TextSpan(
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(32, 124, 232, 1)),
                              text: "SIGN UP",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, SignUpScreen.routeName);
                                })
                        ])),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
