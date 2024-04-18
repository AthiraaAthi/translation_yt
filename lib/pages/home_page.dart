import 'package:auto_translate_checking/classes/language_class.dart';
import 'package:auto_translate_checking/localization/language_constant.dart';
import 'package:auto_translate_checking/main.dart';
import 'package:auto_translate_checking/router/custom_router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //_changeLanguage

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
// ui of home page
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'appTitle').toString()),
//DropdownButton

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),

            // We add Dropdown Button for manual control with language-switcher

            child: DropdownButton<Language>(
              underline: SizedBox(),

              // ui of icon

              icon: Icon(
                Icons.g_translate,
                color: Colors.white,
              ),

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
            ),
          ),
        ],
      ),
//Drawer
      drawer: Drawer(
// to call _drawerList widget
        child: _drawerList(),
      ),

//body

      body: Container(
        padding: EdgeInsets.all(5),
        // to call _mainPadding widget
        child: _mainPadding(context),
      ),
    );
  }
//ui of _mainPadding widget

// ui of _mainPadding widget

  Padding _mainPadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            child: Center(
              // to get translated text

              child: Text(
                getTranslated(context, 'header')!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 12.0),

          Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              // to get translated text

              getTranslated(context, "description")!,

              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ),

// ui of list in home page

          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                      child: Column(children: [
                    // list 1

                    ListTile(
                      trailing: Icon(Icons.add),

                      leading: Icon(Icons.image),

                      // to get translated text

                      title: Text(
                        getTranslated(context, 'productOneName')!,
                      ),

                      subtitle: Text(
                        "\$500",
                      ),
                    ),

                    // list 2

                    ListTile(
                      trailing: Icon(Icons.add),

                      leading: Icon(Icons.image),

                      // to get translated text

                      title: Text(
                        getTranslated(context, "productTwoName")!,
                      ),

                      subtitle: Text(
                        "\$500",
                      ),
                    ),

                    // list 3

                    ListTile(
                      trailing: Icon(Icons.add),

                      leading: Icon(Icons.image),

                      // to get translated text

                      title: Text(
                        getTranslated(context, "productThreeName")!,
                      ),

                      subtitle: Text(
                        "\$500",
                      ),
                    ),

                    // list 4

                    ListTile(
                      trailing: Icon(Icons.add),

                      leading: Icon(Icons.image),

                      // to get translated text

                      title: Text(
                        getTranslated(context, "productFourName")!,
                      ),

                      subtitle: Text(
                        "\$220",
                      ),
                    ),

                    // list 5

                    ListTile(
                      trailing: Icon(Icons.add),

                      leading: Icon(Icons.image),

                      // to get translated text

                      title: Text(
                        getTranslated(context, "productFiveName")!,
                      ),

                      subtitle: Text(
                        "\$399",
                      ),
                    ),
                  ])),
                ),
              ],
            ),
          ),

          // ui of buttons in home page

          SizedBox(
            height: 35.0,

            // button 1

            child: ElevatedButton(
              onPressed: () {},

              // to get translated text

              child: Text(
                getTranslated(context, "discoverButtonText")!,
                style: TextStyle(color: Colors.white),
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: StadiumBorder(),
                elevation: 2.0,
              ),
            ),
          ),

          SizedBox(height: 12.0),

          SizedBox(
            height: 35.0,

            // button 2

            child: ElevatedButton(
              onPressed: () {},

              // to get translated text

              child: Text(
                getTranslated(context, "codeButtonText")!,
                style: TextStyle(color: Colors.white),
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: StadiumBorder(),
                elevation: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

//ui of _drawerList widget

// ui of _drawerList widget

  Container _drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );

    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(),
            ),
          ),

          // 1

          ListTile(
            // ui of icon

            leading: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30,
            ),

            // to get translated text

            title: Text(
              getTranslated(context, 'about_us')!,
              style: _textStyle,
            ),

            // Navigating to About Page

            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, aboutRoute);
            },
          ),

          // 2

          ListTile(
            // ui of icon

            leading: Icon(
              Icons.settings_applications,
              color: Colors.white,
              size: 30,
            ),

            title: Text(
              // to get translated text

              getTranslated(context, 'settings')!,

              style: _textStyle,
            ),

            // Navigating to settings Page

            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
