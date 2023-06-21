import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'finish_view.dart';

//TODO 課題
//TODO そもそも顎で反応しないっていうね

//解決済み
// BOTTOM OVERLOAD By 1213 PIXELS
// FloatingActionButton のサイズを画面サイズから逆算して、指定するようにする　かつ　画面中央におきたい
// FloatingActionButton の当たり判定が表示ボタンよりも広い
//TODO _timeRemainingではミリ秒も出したい（msからデクリメントしているのを視覚的に見せることで焦燥感をあおる） できたけど、表示する数字でカクツクのが気になる

class PushUpScreen extends StatefulWidget {
  const PushUpScreen({Key? key}) : super(key: key);

  @override
  PushUpScreenState createState() => PushUpScreenState();
}

class PushUpScreenState extends State<PushUpScreen> {
  int _counter = 0;
  double _timeRemaining = 4.99;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      if (_timeRemaining > 0.01) {
        setState(() {
          _timeRemaining -= 0.01;
        });
      } else {
        timer.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FinishScreen(counterResultValue: _counter.toString()),
          ),
        );
      }
    });
  }

  String formatTime(double time) {
    // 引数には少数点以下で表示したい桁数を設定
    return time.toStringAsFixed(2);
  }

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonSize = screenWidth * 0.8;

    final textTopPosition = (screenHeight - buttonSize) * 0.1; // ボタンより上に配置
    final textBottomPosition = (screenHeight - buttonSize) * 0.2; // 残り時間より下に配置

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: FloatingActionButton(
                onPressed: incrementCounter,
                tooltip: 'Increment',
                backgroundColor: const Color.fromRGBO(128, 7, 18, 1),
              ),
            ),
          ),
          Positioned(
            top: textTopPosition,
            left: 0,
            right: 0,
            child: Text(
              formatTime(_timeRemaining),
              textAlign: TextAlign.center,
              style: GoogleFonts.goldman(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(128, 7, 18, 1),
                  fontSize: 80,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
            ),
          ),
          Positioned(
            top: textBottomPosition,
            left: 0,
            right: 0,
            child: Text(
              _counter.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.goldman(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(128, 7, 18, 1),
                  fontSize: 90,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
