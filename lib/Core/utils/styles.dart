import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/constants.dart';

abstract class Styles {
  static const sFProDisplayBold = TextStyle(
    fontSize: 38,
    fontFamily: kSFProDisplayBold,
    fontWeight: FontWeight.w700,
  );
  static const sFProDisplayRegular = TextStyle(
    fontSize: 12,
    fontFamily: kSFProDisplayRegular,
    fontWeight: FontWeight.w400,
  );
  static const sFProDisplayBlack = TextStyle(
    fontSize: 20,
    fontFamily: kSFProDisplayBlack,
    fontWeight: FontWeight.w900,
    color: Color(0xff0062FF),
  );
}
