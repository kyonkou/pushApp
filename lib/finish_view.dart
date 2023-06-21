import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushup/result_view.dart';

import 'countdown_view.dart';
import 'main.dart';

//TODO FinishScreenを出すと背景が真っ黒になる

class FinishScreen extends StatelessWidget {
  final String strFinish = "FINISH!";
  final String counterResultValue;

  //TODO デフォルトではなく、腕立て回数をコンストラクタに詰めて、リザルト画面に渡していきたい
  const FinishScreen({required this.counterResultValue, Key? key})
      : super(key: key);

  void showResultButtonPressed(BuildContext context) {
    String counterResultValue = this.counterResultValue;
    if (counterResultValue.isEmpty) {
      counterResultValue = "00";
    }
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultScreen(resultValue: counterResultValue)),
    );
  }

  void startButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.goldmanTextTheme(),
        brightness: Brightness.light,
      ),
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Text(
                  strFinish,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.goldman(
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(128, 7, 18, 1),
                      fontSize: 90,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
                Text(
                  "${counterResultValue}times",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.goldman(
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(128, 7, 18, 1),
                      fontSize: 60,
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  ),
                  child: Text(
                    'TOP',
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
                    startButtonPressed;
                    //TODO 暫定対応　ランキング画面が終わり次第、以下の動線復活予定
                    //showResultButtonPressed(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  ),
                  child: Text(
                    'RANKING',
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
        ),
      ),
    );
  }
}
