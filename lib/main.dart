import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Hand {
  top,
  bottom,
  right,
  left;

  String get text {
    switch (this) {
      case Hand.top:
        return '👆';
      case Hand.bottom:
        return '👇️';
      case Hand.right:
        return '👉';
      case Hand.left:
        return '👈';
    }
  }
}

enum Result {
  win,
  lose;

  String get text {
    switch (this) {
      case Result.win:
        return '勝ち';
      case Result.lose:
        return '負け';
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Hand? myHand;
  Hand? computerHand;
  Result? result;

  List<Hand> jankenList = [Hand.top, Hand.bottom, Hand.right, Hand.left];

  void chooseComputerText() {
    final random = Random();
    final randomNumber = random.nextInt(4);
    final hand = Hand.values[randomNumber];
    setState((){
      computerHand = hand;
    });
    decideResult();
  }

  void decideResult() {
    if(myHand == null || computerHand == null) {
      return;
    }
    final Result result;

    if (myHand == Hand.top && computerHand == Hand.top) {
      result = Result.win;
    } else if (myHand == Hand.bottom && computerHand == Hand.bottom) {
      result = Result.win;
    } else if (myHand == Hand.right && computerHand == Hand.right) {
      result = Result.win;
    } else if (myHand == Hand.left && computerHand == Hand.left) {
      result = Result.win;
    } else {
      result = Result.lose;
    }
    setState(() {
      this.result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '相手',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              computerHand?.text ?? '?',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              result?.text ?? '?',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              '自分',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              myHand?.text ?? '?',
              style: TextStyle(fontSize: 100),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: (){
                setState(() {
                  myHand = Hand.top;
                });
                chooseComputerText();
              },
            tooltip: 'Increment',
            child: const Text(
                '👆',
              style: TextStyle(fontSize: 30),
            ),
          ),

          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                myHand = Hand.bottom;
              });
              chooseComputerText();
            },
            tooltip: 'Increment',
            child: const Text(
              '👇',
              style: TextStyle(fontSize: 30),
            ),
          ),

          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                myHand = Hand.right;
              });
              chooseComputerText();
            },
            tooltip: 'Increment',
            child: const Text(
              '👉',
              style: TextStyle(fontSize: 30),
            ),
          ),

          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                myHand = Hand.left;
              });
              chooseComputerText();
            },
            tooltip: 'Increment',
            child: const Text(
              '👈',
              style: TextStyle(fontSize: 30),
            ),
          ),

        ],
      ),
    );
  }
}
