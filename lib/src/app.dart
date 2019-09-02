import 'package:flutter/material.dart';

import '../src/ui/movie_list.dart';
import '../src/ui/login.dart';
import 'login/authentication_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      StreamBuilder(
          stream: bloc.token,
          builder: (context, AsyncSnapshot<String> snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              bloc.fetchToken();
              return Scaffold(
                body: Center(
                  child: Text('Loading'),
                ),
              );
            }
             return snapshot.hasData ?
             MovieList() :
             LoginScreen();
          })
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

}



