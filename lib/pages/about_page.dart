import 'package:auto_translate_checking/localization/language_constant.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    // ui of about page

    return Scaffold(
      appBar: AppBar(
        title: Text(

            // to get translated text

            getTranslated(context, 'about_us')!),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(

              // to get translated text

              getTranslated(context, 'about')!),
        ),
      ),
    );
  }
}
