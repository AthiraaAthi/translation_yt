import 'package:auto_translate_checking/localization/demo_localization.dart';
import 'package:auto_translate_checking/localization/language_constant.dart';
import 'package:auto_translate_checking/router/custom_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

// static setLocale
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// difine _locale
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

// didChangeDependencies
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // CircularProgressIndicator

    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[800])),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Localization Demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        // difine _locale
        locale: _locale,

        // localizationsDelegates
        localizationsDelegates: [
          DemoLocalization.delegate,
          // delegate from flutter_localization

          GlobalMaterialLocalizations.delegate,

          GlobalWidgetsLocalizations.delegate,

          GlobalCupertinoLocalizations.delegate,
        ],

        //   supportedLocales
        supportedLocales: [
          Locale("en", "US"),
          Locale("ar", "SA"),
          Locale("hi", "IN")
        ],

        //   localeResolutionCallback

        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
// If the current locale doesn't match with any of the
// supportedLocales, use the first supportedLocale, i.e., English.
          return supportedLocales.first;
        },

        onGenerateRoute: CustomRouter.generatedRoute,
        initialRoute: homeRoute,
      );
    }
  }
}
