import "package:flutter/material.dart";

// widget
import "package:download_portal/ui/widget/common/button_widget.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TapRetryWidget extends ConsumerWidget {
  final dynamic provider;

  const TapRetryWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            size: 60,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Oops! Something went wrong.',
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 180,
            child: CustomButtonWithIcon(
              icon: Icons.refresh,
              isLoading: false,
              label: "Retry",
              onPressEvent: () => ref.refresh(provider),
              backgroundColor: Colors.grey.shade200,
            ),
          )
        ],
      ),
    );
  }
}
