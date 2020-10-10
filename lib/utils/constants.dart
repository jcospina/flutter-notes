import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color kBaseTextColor = Color(0xFF535353);
Color kBaseTextColorLight = kBaseTextColor.withOpacity(0.5);
Color kBGColor = Color(0xFFfff7f3);
Color kDarkBlueColor = Color(0xFF2C2B4B);

TextStyle kNoteTextStyle = TextStyle(
  fontFamily: 'Neucha',
  color: kBaseTextColor,
);

TextStyle kTitleTextStyle = TextStyle(
  fontFamily: 'Open Sans',
  fontWeight: FontWeight.bold,
  color: kDarkBlueColor,
);

TextStyle kPlaceHolderStyle = kTitleTextStyle.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: kBaseTextColorLight,
);
