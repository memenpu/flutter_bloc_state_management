import 'package:flutter/material.dart';

import '../src/ui/movie_list.dart';
import '../src/ui/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyCustomForm(),
      ),
    );
  }
}
