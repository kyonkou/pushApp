import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:pushup/pushup_view.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  State createState() {
    return CountDownState();
  }
}

late BuildContext _context;


class CountDownState extends State<CountDown> {
  int counter = 5;

  @override
  void initState() {
    super.initState();
    _context = context;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (counter > 0) {

        setState(() {counter--;});
      } else {
        timer.cancel();
        Navigator.push(_context,
            MaterialPageRoute(builder: (context) => const PushUpScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.goldmanTextTheme(),
        brightness: Brightness.light,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                counter.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.goldman(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(128, 7, 18, 1),
                    // fontFamily: 'Goldman-Bold',
                    fontSize: 100,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
