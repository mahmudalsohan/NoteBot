import 'dart:async';

import 'package:butex_notebot/views/entertainment/noterunner/dino.dart';
import 'package:butex_notebot/views/entertainment/noterunner/game_over_screen.dart';
import 'package:butex_notebot/views/entertainment/noterunner/score_screen.dart';
import 'package:butex_notebot/views/entertainment/noterunner/taptoplay.dart';
import 'package:flutter/material.dart';

import 'barrier.dart';

class NoteRunnerPlayScreen extends StatefulWidget {
  const NoteRunnerPlayScreen({Key? key}) : super(key: key);

  @override
  _NoteRunnerPlayScreenState createState() => _NoteRunnerPlayScreenState();
}

class _NoteRunnerPlayScreenState extends State<NoteRunnerPlayScreen> {
  // dino variables (out of 2)
  double dinoX = -0.5;
  double dinoY = 1;
  double dinoWidth = 0.2;
  double dinoHeight = 0.4;

  // barrier variables (out of 2)
  double barrierX = 1;
  double barrierY = 1;
  double barrierWidth = 0.2;
  double barrierHeight = 0.4;

  // jump variables
  double time = 0;
  double height = 0;
  double gravity = 9.8; // gravity in real life is 9.8
  double velocity = 5; // how strong the jump is

  // game settings
  bool gameHasStarted = false;
  bool midJump =
      false; // this prevents a double jump and also stops user from starting too many timers!! will crash our app
  bool gameOver = false;
  int score = 0;
  int highscore = 0;
  bool dinoPassedBarrier = false;

  // this will make the map start moving, ie. barriers will start to move
  void startGame() {
    setState(() {
      gameHasStarted = true;
    });

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // check for if dino hits barrier
      if (detectCollision()) {
        gameOver = true;
        timer.cancel();
        setState(() {
          if (score > highscore) {
            highscore = score;
          }
        });
      }

      // loop barrier to keep the map going
      loopBarriers();

      // update score
      updateScore();

      setState(() {
        barrierX -= 0.01;
      });
    });
  }

  // update score
  void updateScore() {
    if (barrierX < dinoX && dinoPassedBarrier == false) {
      setState(() {
        dinoPassedBarrier = true;
        score++;
      });
    }
  }

  // loop barriers
  void loopBarriers() {
    setState(() {
      if (barrierX <= -1.2) {
        barrierX = 1.2;
        dinoPassedBarrier = false;
      }
    });
  }

  // barrier collision detection
  bool detectCollision() {
    if (barrierX <= dinoX + dinoWidth &&
        barrierX + barrierWidth >= dinoX &&
        dinoY >= barrierY - barrierHeight) {
      return true;
    }

    return false;
  }

  // dino jump
  void jump() {
    midJump = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      height = -gravity / 2 * time * time + velocity * time;

      setState(() {
        if (1 - height > 1) {
          resetJump();
          dinoY = 1;
          timer.cancel();
        } else {
          dinoY = 1 - height;
        }
      });

      // check if dead
      if (gameOver) {
        timer.cancel();
      }

      // keep the time going
      time += 0.01;
    });
  }

  void resetJump() {
    midJump = false;
    time = 0;
  }

  void playAgain() {
    setState(() {
      gameOver = false;
      gameHasStarted = false;
      barrierX = 1.2;
      score = 0;
      dinoY = 1;
      midJump = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: gameOver
            ? (playAgain)
            : (gameHasStarted ? (midJump ? null : jump) : startGame),
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Stack(
                      children: [
                        // tap to play
                        TapToPlay(
                          gameHasStarted: gameHasStarted,
                        ),

                        // game over screen
                        GameOverScreen(
                          gameOver: gameOver,
                        ),

                        // dino
                        MyDino(
                          dinoX: dinoX,
                          dinoY: dinoY - dinoHeight,
                          dinoWidth: dinoWidth,
                          dinoHeight: dinoHeight,
                        ),

                        // barrier
                        MyBarrier(
                          barrierX: barrierX,
                          barrierY: barrierY - barrierHeight,
                          barrierWidth: barrierWidth,
                          barrierHeight: barrierHeight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[600],
                  child: Center(
                    child: ScoreScreen(
                      score: score,
                      highscore: highscore,
                    ),
                  ),
                  // child: Center(
                  //   child: Text(
                  //     'C R E A T E D B Y K O K O',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 22,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
