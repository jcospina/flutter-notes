import 'package:flutter/material.dart';
import 'package:flutter_notes/utils/constants.dart';

class Link extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final FontWeight fontWeight;

  const Link({Key key, this.label, this.onTap, this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: kTitleTextStyle.copyWith(
          color: color,
          fontWeight: fontWeight ?? FontWeight.w800,
        ),
      ),
    );
  }
}
