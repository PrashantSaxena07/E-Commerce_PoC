import 'package:flutter/widgets.dart';

abstract class Strings {
  String get Footwear;
  String get French;
  String get English;
  String get Theme;
  String get Dark;
  String get Light;


  static Strings? of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }
}