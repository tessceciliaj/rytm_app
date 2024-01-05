import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
            ),
      ),
      home: const MyHomePage(title: 'Rytm'),
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
  var randomizer = Random();
  double currentPercent = 0.2;

  void _randomPercentage() {
    setState(() {
      currentPercent = randomizer.nextDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 35, 35, 35),
      appBar: AppBar(
        centerTitle: false, // Set to false to allow manual centering
        foregroundColor: const Color.fromARGB(255, 105, 105, 105),
        backgroundColor: const Color.fromARGB(225, 35, 35, 35),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(Icons.menu),
            Expanded(
              child: Center(
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/holo.png'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Hello, <name>',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              LinearPercentIndicator(
                width: 300.0,
                lineHeight: 20.0,
                percent: currentPercent,
                backgroundColor: const Color.fromARGB(255, 69, 69, 69),
                progressColor: const Color.fromARGB(255, 231, 250, 170),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$currentPercent %",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomPercentage,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
