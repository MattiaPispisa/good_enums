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
  final Environment environment = Environment.dev;

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
        Text(environment.isDev() ? "IsDev" : ''),
      ]),
    );
  }
}
