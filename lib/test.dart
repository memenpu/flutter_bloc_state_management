import 'package:http/http.dart' as http;

import 'dart:io';
import 'dart:convert';

main() async{
//  Client DongeyClient = Client();



  print("hello");

    final String url = "http://ec2-52-34-35-1.us-west-2.compute.amazonaws.com:8080/api/token-auth";

    final String email = "abc@hotmail.com";
    final String password = "123456";
    var map = JwtRequest(email: email, password: password).toJson();
    var response = await http.post(url, body: json.encode(map));
    print(response.statusCode);
    print(response.body);
    print(response.headers);
}

class JwtRequest{
  final String email;
  final String password;

  JwtRequest({this.email, this.password});


  Map<String, dynamic> toJson() => _$AwtRequestToJson(this);

  Map<String, dynamic> _$AwtRequestToJson(JwtRequest instance) =>
      <String, dynamic>{
        'email': instance.email,
        'password': instance.password,
      };
}