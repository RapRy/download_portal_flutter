import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";

// widgets
import "package:download_portal/ui/widget/common/avatar_heading_widget.dart";

// provider
import "package:download_portal/provider/preference/preference_provider.dart";

class AccountOverviewScreen extends ConsumerWidget {
  const AccountOverviewScreen({super.key});
  static const routeName = "/account-overview";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCredential = ref.read(preferenceProvider).getUserCredential();

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
        child: Column(
          children: [
            const AvatarHeadingWidget(
              isAccount: true,
            ),
            Text('Account Overview'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(242, 242, 242, 1)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Account ID:"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            userCredential?.accountId.toString() as String,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(32, 124, 232, 1),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text("Account Name:"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${userCredential?.name?.firstName} ${userCredential?.name?.lastName}",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(32, 124, 232, 1),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text("Mobile Number:"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            userCredential?.mobile.toString() as String,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(32, 124, 232, 1),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text("Email:"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            userCredential?.email as String,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(32, 124, 232, 1),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (userCredential?.meta?.activities != null)
                        Row(
                          children: [
                            const Text("Recent Activity:"),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              DateFormat.yMMMd().format(userCredential
                                  ?.meta?.activities![0].createdAt as DateTime),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(32, 124, 232, 1),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (userCredential?.receiveUpdate?.sms != null ||
                          userCredential?.receiveUpdate?.email != null)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "*Receives update via ${userCredential!.receiveUpdate!.sms! ? "SMS" : "EMAIL"}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                    ],
                  )),
            ),
            Padding(padding: const EdgeInsets.all(20), child: Placeholder())
          ],
        ),
      ),
    );
  }
}
