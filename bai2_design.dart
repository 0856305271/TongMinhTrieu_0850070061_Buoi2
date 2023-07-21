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
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chủ"),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 590,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Tống Minh Triệu, 08_ĐH_TMĐT",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ColoredBox(color: Colors.blue),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ColoredBox(color: Colors.green),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ColoredBox(color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
              Image.network('https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                width: 300,
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Xin chào!"),
                    ));
                  },
                  child: const Text("Bấm vào đây!"))
            ],
          ),
        ),
      ),
    );
  }
}
