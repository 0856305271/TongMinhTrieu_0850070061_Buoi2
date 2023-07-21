import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

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
  final TextEditingController _numberController = TextEditingController();
  String kq = "";

  void _checkNumber() {
    setState(() {
      int a = int.parse(_numberController.text);
      bool isPrime = true;
      int t = sqrt(a).floor();
      if(a<2)
      {
        isPrime=false;
      }
      for (int i = 2; i <= t; i++) {
        if (a % i == 0) {
          isPrime = false;
          break;
        }
      }

      isPrime
          ? kq = "Số $a là số nguyên tố."
          : kq = "Số $a không là số nguyên tố.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kiểm tra số nguyên tố"),
      ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            width: 590,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                        labelText: "Nhập một số",
                        labelStyle: TextStyle(fontSize: 25)),
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                ElevatedButton(
                    onPressed: _checkNumber, child: const Text("Kiểm tra")),
                const SizedBox(height: 50),
                Text(kq,
                    style: const TextStyle(fontSize: 20, color: Colors.red))
              ],
            )),
      ),
    );
  }
}
