import 'package:flutter/material.dart';

import '../utils/game_utils.dart';

class GamePlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final word = GameUtils.getRandomWord();

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(title: const Text('お題'), automaticallyImplyLeading: true),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Text(
              word,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
