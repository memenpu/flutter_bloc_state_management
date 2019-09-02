import 'dart:convert';
import 'package:flutter_bloc_state_management/src/resources/dongey_api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../../main.dart';
import '../../test.dart';

class UserRepository {

  final dongeyApiProvider = DongeyApiProvider();

  Future<String> authenticate({
    @required String email,
    @required String password,
  }) => dongeyApiProvider.fetchToken(email ,password);

  Future<void> deleteToken() async {
    await CustomerInfo().storage.delete(key: 'token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await CustomerInfo().storage.write(key: 'token', value: token);
    return;
  }

  Future<String> getLocalToken() async {
    /// read from keystore/keychain
    var userStorage = CustomerInfo().storage;
    String token = await userStorage.read(key: 'token');

    return token;
  }
}
