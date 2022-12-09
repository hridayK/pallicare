import 'package:flutter/material.dart';
import 'package:pallicare/screens/home.dart';
import 'package:pallicare/screens/search.dart';

void main() {
  // runApp(const App());
  print("Hello World testing out here!");
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/search": (context) => const Search(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
