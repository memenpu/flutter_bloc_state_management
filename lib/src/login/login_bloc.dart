import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../test.dart';

class LoginEvent{
  final String email;
  final String password;
//  final JwtRequest jwtRequest;
  LoginEvent({this.email,this.password,});
//  LoginEvent({this.jwtRequest});
}

class LoginBloc{
  final StreamController<JwtRequest> tokenRequestSC = StreamController<JwtRequest>();
  final StreamController<LoginEvent> loginEventSC = StreamController<LoginEvent>();

//  Stream<LoginEvent> get LoginEventStream => loginEventSC.stream;
  LoginBloc(){
    loginEventSC.stream.listen(mapLoginEventSCtoRequest);
  }

  void mapLoginEventSCtoRequest(LoginEvent event) async{
    if(event is LoginEvent){
      final String url = "http://ec2-52-34-35-1.us-west-2.compute.amazonaws.com:8080/api/token-auth";
//      final String email = "abc@hotmail.com";
//      final String password = "123456";
      var map = JwtRequest(email: event.email, password: event.password).toJson();
      var response = await http.post(url, body: json.encode(map));
      debugPrint('${response.statusCode}');
      debugPrint(response.body.toString());
      debugPrint(response.headers.toString());
      debugPrint(response.headers['authorization']);
      await storage.write(key: 'token', value: response.headers['authorization']);
    }else{
      await storage.deleteAll();
    }

    debugPrint("$event");
  }

  void dispose(){
    tokenRequestSC.close();
    loginEventSC.close();
  }
}