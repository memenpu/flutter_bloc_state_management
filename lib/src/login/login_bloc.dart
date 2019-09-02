
import 'package:flutter_bloc_state_management/src/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = UserRepository();
  final _tokenFetcher = PublishSubject<String>();

  Observable<String> get token => _tokenFetcher.stream;

  fetchToken({String email, String password}) async {
    try{
      String token = await _repository.authenticate(email: email, password: password);
      _repository.persistToken(token);
      _tokenFetcher.sink.add(token);
    }catch(Expection){
      throw Expection("Failed to log in");
    }
  }

  deleteToken(){
    _repository.deleteToken();
  }

  dispose() {
    _tokenFetcher.close();
  }
}

final bloc = LoginBloc();