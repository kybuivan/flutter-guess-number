// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

/// An extremely silly example of a game state.
///
/// Tracks only a single variable, [progress], and calls [onWin] when
/// the value of [progress] reaches [goal].
class LevelState extends ChangeNotifier {
  final VoidCallback onWin;

  final ValueSetter showMsg;

  final int goal;

  int enteredNumber = 0;
  
  LevelState({required this.onWin, required this.showMsg, this.goal = 1});

  void evaluate(int value) {
    enteredNumber++;

    String msg = "Your guess of $enteredNumber is ";
    if (value == goal) {
      onWin();
      msg += "correct";
    }
    else if(value > goal)
    {
      msg += "too high";
    }
    else
    {
      msg += "too low";
    }
    showMsg(msg);
  }
}
