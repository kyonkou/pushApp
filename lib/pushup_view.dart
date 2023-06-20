import 'dart:async';

import 'package:flutter/material.dart';


import 'main.dart';

class PushUpScreen extends StatefulWidget {
  const PushUpScreen({Key? key}) : super(key: key);

  @override
  PushUpScreenState createState() => PushUpScreenState();
}

class PushUpScreenState extends State<PushUpScreen> {
  int _counter = 0;
  int _timeRemaining = 5;

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const PushApp()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Time remaining: $_timeRemaining',
            ),
            Text(
              'Push-ups: $_counter',
            ),
            FloatingActionButton(
              onPressed: _startCountdown,
              tooltip: 'Start',
              child: const Icon(Icons.play_arrow),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
