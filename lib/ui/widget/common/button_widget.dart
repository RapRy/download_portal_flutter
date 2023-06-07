import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {super.key,
      required this.icon,
      required this.isLoading,
      required this.label,
      required this.onPressEvent,
      this.backgroundColor = const Color.fromRGBO(146, 220, 126, 1),
      this.foregroundColor = const Color.fromRGBO(64, 58, 58, 1)});
  final IconData icon;
  final VoidCallback? onPressEvent;
  final bool isLoading;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle btnWithIconStyle = ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
          style: btnWithIconStyle,
          onPressed: () => isLoading ? null : onPressEvent!(),
          label: Text(label),
          icon: Icon(
            icon,
            size: 27,
          )),
    );
  }
}
