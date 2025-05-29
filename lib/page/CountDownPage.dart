import 'dart:async';

import 'package:flutter/material.dart';

import 'GamePlayPage.dart';

class CountDownPage extends StatefulWidget {
  @override
  _CountDownPageState createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  int _count = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_count > 1) {
          _count--;
        } else {
          _timer?.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => GamePlayPage()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder:
              (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
          child: Text(
            _count.toString(),
            key: ValueKey(_count),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              fontSize: 96,
            ),
          ),
        ),
      ),
    );
  }
}
