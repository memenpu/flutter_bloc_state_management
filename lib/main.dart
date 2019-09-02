import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'src/app.dart';
// Create storage
class CustomerInfo extends Object{
  static final CustomerInfo customerInfo = CustomerInfo._internal(new FlutterSecureStorage());
  final FlutterSecureStorage storage;

  CustomerInfo._internal(this.storage);
  factory CustomerInfo(){
    return customerInfo;
  }
}


void main() => runApp(App());



