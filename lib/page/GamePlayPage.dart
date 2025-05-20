import 'package:flutter/material.dart';

import '../utils/game_utils.dart';

class GamePlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final word = GameUtils.getRandomWord();

    return Scaffold(
      body: Center(
        child: Text(word, style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}
