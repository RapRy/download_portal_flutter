import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter/material.dart';

// widgets
import "../../widget/auth/sign_up_widget.dart";
import "../../widget/auth/register_widget.dart";
import 'package:download_portal/ui/widget/common/avatar_heading_widget.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = "/sign-up";

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(""),
        leading: BackButton(
          color: Colors.black87,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const AvatarHeadingWidget(),
          const RegisterWidget(),
          const Divider(color: Colors.black),
          const SignUpWidget()
        ]),
      ),
    );
  }
}
