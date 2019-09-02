


import 'package:flutter_bloc_state_management/src/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationBloc {
  final _repository = UserRepository();
  final _tokenFetcher = PublishSubject<String>();

  Observable<String> get token => _tokenFetcher.stream;

  fetchToken() async {
    try{
      String token = await _repository.getLocalToken();
      _tokenFetcher.sink.add(token);
    }catch(Expection){
      throw Expection("don't have token");
    }
  }

  dispose() {
    _tokenFetcher.close();
  }
}

final bloc = AuthenticationBloc();