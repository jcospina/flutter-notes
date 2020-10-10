import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  final String logo = 'assets/icon.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SvgPicture.asset(
              logo,
              semanticsLabel: 'Notes icon',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
