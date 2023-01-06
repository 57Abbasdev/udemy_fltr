import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final Text title;

  const IconContent({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        title
      ],
    );
  }
}
