import 'dart:math';

import 'package:example/app/environment.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Good Enum example",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Environment environment = Environment.dev;

  @override
  Widget build(BuildContext context) {
    switch (environment) {
      case Environment.dev:
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(title: Text("Good Enum example")),
      body: Column(children: [
        Text(environment.isDev() ? "IsDev" : 'IsNotDev'),
        environment.ifIs(
          dev: () => Text("IsDev"),
          prod: () => Text("IsProd"),
          stage: () => Text("IsStage"),
        ),
        environment.maybeIfIs(
          dev: () => Text("IsDev"),
          orElse: () => Text("IsElse"),
        ),
        ElevatedButton(
          onPressed: () {
            final random = Random().nextInt(3);
            final env = Environment.values[random];
            setState(() {
              environment = env;
            });
          },
          child: Text("Change env"),
        )
      ]),
    );
  }
}
