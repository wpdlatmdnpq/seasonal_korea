import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seasonal_korea_app/page/welcome_screen.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/font/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(SeasonalKorea());
}

class SeasonalKorea extends StatelessWidget {
  SeasonalKorea();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 97, 153, 200),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontFamily: 'NotoSansKR', fontSize: 14),
        ),
      ),
      home: Welcome(),
    );
  }
}
