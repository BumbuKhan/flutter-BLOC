import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit(){
    final email = _email.value;
    final password = _password.value;

    print('email is ${email} & password is ${password}');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}