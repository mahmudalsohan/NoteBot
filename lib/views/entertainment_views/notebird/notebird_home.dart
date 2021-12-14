import 'dart:async';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/views/entertainment_views/entertainment_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'bird.dart';
import 'notebird_barrier.dart';
import 'notebird_popup.dart';

class NotebirdHomePage extends StatefulWidget {
  const NotebirdHomePage({Key? key}) : super(key: key);

  @override
  _NotebirdHomePageState createState() => _NotebirdHomePageState();
}

class _NotebirdHomePageState extends State<NotebirdHomePage> {
  // bird variables
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -9.8; // how strong the gravity is
  double velocity = 2.8; // how strong the jump is
  double birdWidth = 0.17; // out of 2, 2 being the entire width of the screen
  double birdHeight = 0.14; // out of 2, 2 being the entire height of the screen
  int score = 0;
  int bestScore = GetStorage().read(GetStorageKey.BS_NOTEBIRD) ?? 0;
  // game settings
  bool gameHasStarted = false;
  bool isCounted = false;

  // barrier variables
  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.3; // out of 2
  List<List<double>> barrierHeight = [
    // out of 2, where 2 is the entire height of the screen
    // [topHeight, bottomHeight]
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // a real physical jump is the same as an upside down parabola
      // so this is a simple quadratic equation
      height = velocity * time + 0.5 * gravity * time * time;

      setState(() {
        birdY = initialPos - height;
      });

      // check if bird is dead
      if (birdIsDead()) {
        timer.cancel();
        _updateScore();
        _showDialog();
      }

      // keep the map moving (move barriers)
      moveMap();

      // keep the time going!
      time += 0.01;
    });
  }

  void _updateScore() {
    if (GetStorage().read(GetStorageKey.BS_NOTEBIRD) == null) {
      GetStorage().write(GetStorageKey.BS_NOTEBIRD, 0);
    }

    if (score > GetStorage().read(GetStorageKey.BS_NOTEBIRD)) {
      bestScore = score;
      GetStorage().write(GetStorageKey.BS_NOTEBIRD, score);
    }
  }

  void moveMap() {
    for (int i = 0; i < barrierX.length; i++) {
      // keep barriers moving
      setState(() {
        barrierX[i] -= 0.005;
      });

      if (isCounted == false && barrierX[i] < -1.5 / 2) {
        score += 10;
        isCounted = true;
      }

      // if barrier exits in the left part of the screen, keep it looping
      if (barrierX[i] < -1.5) {
        barrierX[i] += 3;
        isCounted = false;
      }
    }
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      initialPos = birdY;
      barrierX = [2, 2 + 1.5];
      score = 0;
      isCounted = false;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                "G A M E  O V E R",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  resetGame();
                  Get.back();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text(
                      'QUIT',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text(
                      'PLAY AGAIN',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPos = birdY;
    });
  }

  bool birdIsDead() {
    // check if the bird is hitting the top or the bottom of the screen
    if (birdY < -1 || birdY > 1) {
      return true;
    }

    // hits barriers
    // checks if bird is within x coordinates and y coordinates of barriers
    for (int i = 0; i < barrierX.length; i++) {
      if ((barrierX[i] <= birdWidth) &&
          (barrierX[i] + barrierWidth >= -birdWidth) &&
          ((birdY <= -1 + barrierHeight[i][0]) ||
              (birdY + birdHeight >= 1 - barrierHeight[i][1]))) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Stack(
                      children: [
                        // bird
                        MyBird(
                          birdY: birdY,
                          birdWidth: birdWidth,
                          birdHeight: birdHeight,
                        ),

                        // tap to play
                        MyCoverScreen(gameHasStarted: gameHasStarted),

                        /*Builder(
                          builder: (BuildContext context) {
                            for (int i = 0; i < barrierX.length; i++) {
                              for (int ) {
                                return MyBarrier(
                                barrierX: barrierX[i],
                                barrierWidth: barrierWidth,
                                barrierHeight: barrierHeight[i][0],
                                isThisBottomBarrier: false,
                              );
                              }
                            }
                            return Container();
                          },
                        ),*/

                        // Top barrier 0
                        MyBarrier(
                          barrierX: barrierX[0],
                          barrierWidth: barrierWidth,
                          barrierHeight: barrierHeight[0][0],
                          isThisBottomBarrier: false,
                        ),

                        // Bottom barrier 0
                        MyBarrier(
                          barrierX: barrierX[0],
                          barrierWidth: barrierWidth,
                          barrierHeight: barrierHeight[0][1],
                          isThisBottomBarrier: true,
                        ),

                        // Top barrier 1
                        MyBarrier(
                          barrierX: barrierX[1],
                          barrierWidth: barrierWidth,
                          barrierHeight: barrierHeight[1][0],
                          isThisBottomBarrier: false,
                        ),

                        // Bottom barrier 1
                        MyBarrier(
                          barrierX: barrierX[1],
                          barrierWidth: barrierWidth,
                          barrierHeight: barrierHeight[1][1],
                          isThisBottomBarrier: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Bottom portion
              Expanded(
                child: Container(
                  color: Colors.brown,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$score',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'S C O R E',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$bestScore",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'B E S T',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
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
