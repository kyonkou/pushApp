import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'countdown_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.goldmanTextTheme(),
        brightness: Brightness.light,
      ),
      home: const Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: PushApp(),
        ),
      ),
    );
  }
}

class PushApp extends StatelessWidget {
  const PushApp({Key? key}) : super(key: key);

  void startButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CountDown()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Text(
              'Push',
              textAlign: TextAlign.center,
              style: GoogleFonts.goldman(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(128, 7, 18, 1),
                  fontSize: 100,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Text(
              'App',
              textAlign: TextAlign.center,
              style: GoogleFonts.goldman(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(128, 7, 18, 1),
                  fontSize: 100,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                startButtonPressed(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
              ),
              child: Text(
                'START',
                textAlign: TextAlign.center,
                style: GoogleFonts.goldman(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(128, 7, 18, 1),
                    fontSize: 50,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startButtonPressed(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
              ),
              child: Text(
                'Ranking',
                textAlign: TextAlign.center,
                style: GoogleFonts.goldman(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(128, 7, 18, 1),
                    fontSize: 50,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
