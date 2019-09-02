import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/src/ui/splash_screen.dart';

import '../src/ui/movie_list.dart';
import '../src/ui/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoadingScreen(),
      ),
    );
  }
}
