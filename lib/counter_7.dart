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
      title: 'Flutter Program',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Program'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _decrementCounter() {
    setState(() => {_counter = max(0, _counter - 1)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: ShowCount(
          counter: _counter,
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Stack(
              children: <Widget>[
                if (_counter > 0)
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: "Decrement",
                        child: const Icon(Icons.remove),
                      )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            )));
  }
}

class ShowCount extends StatelessWidget {
  const ShowCount({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          counter.isOdd ? "GANJIL" : "GENAP",
          style: TextStyle(color: counter.isOdd ? Colors.blue : Colors.red),
        ),
        Text(
          '$counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
