//import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'package:flutter_bloc_state_management/src/app.dart';
//
//import 'package:flutter_bloc_state_management/src/login/login_bloc.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
//import '../../main.dart';
//
//class LoginScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: FlatButton(onPressed: () async{
//          await Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCustomForm()));
//        }, child: Text('Log in')),
//      ),
//    );
//  }
//}
//
//// Define a custom Form widget.
//class MyCustomForm extends StatefulWidget {
//  @override
//  MyCustomFormState createState() {
//    return MyCustomFormState();
//  }
//}
//
//// This class holds data related to the form.
//class MyCustomFormState extends State<MyCustomForm> {
//  // Create a global key that uniquely identifies the Form widget
//  // and allows validation of the form.
//  final _formKey = GlobalKey<FormState>();
//  final _emailController = TextEditingController();
//  final _passwordController = TextEditingController();
//  String token = '';
//
//  @override
//  Widget build(BuildContext context) {
//    final LoginBloc loginBloc = LoginBloc();
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("form"),
//        ),
//        body:
//        Form(
//            key: _formKey,
//            child:
//            StreamBuilder(
//              stream: loginBloc.tokenRequestSC.stream,
//              initialData: null,
//              builder: (BuildContext context, AsyncSnapshot snapshot) {
//                return Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    TextFormField(
//                      controller: _emailController,
//                      decoration: InputDecoration(labelText: 'Enter your email'),
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Please enter some text';
//                        }
//                        return null;
//                      },
//                    ),
//                    TextFormField(
//                      controller: _passwordController,
//                      decoration: InputDecoration(labelText: 'Enter your password'),
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Please enter some text';
//                        }
//                        return null;
//                      },
//                    ),
//                    RaisedButton(
//                      onPressed: () {
//                        if (_formKey.currentState.validate() && !snapshot.hasError) {
//                        String email = _emailController.text;
//                        String password = _passwordController.text;
//                        loginBloc.loginEventSC.add(LoginEvent(email: email, password: password));
//                        Scaffold.of(context).showSnackBar(
//                              SnackBar(content: Text('Loging in')));
//                        }
//                      },
//                      child: Text('Log in'),
//                    ),
//                    RaisedButton(
//                      onPressed: () async{
//                       await CustomerInfo().storage.read(key: 'token').then((r){
//                         token = r;
//                         debugPrint('${r.runtimeType}: $r ');
//                       });
//                       await _neverSatisfied();
//                      },
//                      child: Text('show token'),
//                    ),
//                  ],
//                );
//              },
//            ),
//        ),
//    );
//  }
//
//  Future<void> _neverSatisfied() async {
//    return showDialog<void>(
//      context: context,
//      barrierDismissible: false, // user must tap button!
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text('Rewind and remember'),
//          content: SingleChildScrollView(
//            child: ListBody(
//              children: <Widget>[
//                Text(token),
//              ],
//            ),
//          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('Regret'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
//
//}
