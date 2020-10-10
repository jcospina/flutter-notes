import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;

  RoundedContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
        boxShadow: kElevationToShadow[8],
      ),
      padding: EdgeInsets.only(
        top: 40.0,
        bottom: 20.0,
        left: 30.0,
        right: 30.0,
      ),
      child: child,
    );
  }
}
