import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/localization/strings.dart';

import '../../main.dart';
import '../prefrences.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

enum Language { English, French }

class _LanguageButtonState extends State<LanguageButton> {
  int _langGroup = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.center,
          child: RadioListTile<int>(
            value: 0,
            groupValue: _langGroup,
            onChanged: (value) {
              setState(() {
                _langGroup = value ?? 0;
              });
              MyApp.setLocale(context, Locale("en"));
              Preference.setString(Preference.language, "en");
            },
            title: Text(
              Strings.of(context)!.English,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.center,
          child: RadioListTile<int>(
            value: 1,
            groupValue: _langGroup,
            onChanged: (value) {
              setState(() {
                _langGroup = value ?? 0;
              });
              MyApp.setLocale(context, Locale("fr"));
              Preference.setString(Preference.language, "fr");
            },
            title: Text(
              Strings.of(context)!.French,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
