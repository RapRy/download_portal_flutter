import "package:flutter/material.dart";

class TopBgWidget extends StatelessWidget {
  final double height;
  final Widget? childOfContainer;
  final EdgeInsets? padding;
  final bool isCurve;

  const TopBgWidget(
      {super.key,
      required this.height,
      this.childOfContainer,
      this.padding,
      this.isCurve = true});

  @override
  Widget build(BuildContext context) {
    return isCurve
        ? ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              padding: padding ?? const EdgeInsets.all(0),
              width: double.infinity,
              height: height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: <Color>[
                    Color.fromRGBO(146, 220, 126, 1),
                    Color.fromRGBO(0, 223, 207, 1),
                  ])),
              child: childOfContainer,
            ))
        : Container(
            padding: padding ?? const EdgeInsets.all(0),
            width: double.infinity,
            height: height,
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.topCenter, colors: <Color>[
              Color.fromRGBO(146, 220, 126, 1),
              Color.fromRGBO(0, 223, 207, 1),
            ])),
            child: childOfContainer,
          );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();

    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
