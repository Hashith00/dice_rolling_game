import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Dice Rolling game"),
        backgroundColor: Colors.red.shade800,
      ),
      body: appbody(),
    ),
  ));
}

class appbody extends StatefulWidget {
  const appbody({super.key});

  @override
  State<appbody> createState() => _appbodyState();
}

class _appbodyState extends State<appbody> {
  var leftdicenumber = 1;
  var leftScore = 0;
  var rightdicenumber = 1;
  var rightScore = 0;
  int moves = 10;
  int getRandomInt(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Number of Moves remainig is $moves',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (moves == 0) {
                        } else {
                          leftdicenumber = getRandomInt(1, 6);
                          leftScore += leftdicenumber;
                          moves--;
                        }
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/dice$leftdicenumber.png'),
                        ),
                        Text(
                          'Score is : $leftScore',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (moves == 0) {
                        } else {
                          rightdicenumber = getRandomInt(1, 6);
                          rightScore += rightdicenumber;
                          moves--;
                        }
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/dice$rightdicenumber.png'),
                        Text(
                          'Score is $rightScore',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    moves = 10;
                    rightScore = 0;
                    leftScore = 0;
                    rightdicenumber = 1;
                    leftdicenumber = 1;
                  });
                },
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
