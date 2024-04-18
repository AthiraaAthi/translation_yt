import 'package:auto_translate_checking/classes/language_class.dart';
import 'package:auto_translate_checking/localization/language_constant.dart';
import 'package:auto_translate_checking/main.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // function to change Language code

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);

    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    // ui of setting page

    return Scaffold(
      appBar: AppBar(
        title: Text(

            // to get translated text

            getTranslated(context, 'settings')!),
      ),
      body: Container(
        child: Center(

            // We add Dropdown Button for manual control with language-switcher

            child: DropdownButton<Language>(
          iconSize: 30,

          hint: Text(

              // to get translated text

              getTranslated(context, 'change_language')!),

          // this function to change the languages selected when clicked

          onChanged: (Language? language) {
            _changeLanguage(language!);
          },

          // to get the items of languages list [flags, code country] from Language class

          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        )),
      ),
    );
  }
}
