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
        primarySwatch: Colors.blue,
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

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> _colorArr = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    Colors.pink,
    Colors.lightGreen,
  ];
  int _counter = 0;
  Color _bgColor = Colors.white;

  void _incrementCounter() {
    setState(() {
      _counter++;

      if (_counter % 2 == 0) {
        _colorArr.shuffle();
        _bgColor = _colorArr.first;
      } else {
        _bgColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: const Text("My HomeWork"),
      ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            width: 590,
            child: ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text("Click me to change Background!"))),
      ),
    );
  }
}
