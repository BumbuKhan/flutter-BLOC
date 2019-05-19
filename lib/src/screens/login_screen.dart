import 'package:flutter/material.dart';

import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context){
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 20)),
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 20)),
          submitButton(bloc),
        ],
      )
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'E-mail',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '******',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      }
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      }
    );
  }
}