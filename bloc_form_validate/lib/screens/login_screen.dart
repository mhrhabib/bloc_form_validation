import 'dart:js';

import '/blocs/bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email validation"),
      ),
      body: Column(
        children: [
          emailField(),
          passwordField(),
          submitButton(),
        ],
      ),
    );
  }
}

Widget emailField() {
  return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'email address',
            prefixIcon: const Icon(Icons.email),
            errorText: snapshot.error?.toString(),
          ),
          onChanged: bloc.changeEmail,
        );
      });
}

Widget passwordField() {
  return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          decoration: InputDecoration(
            hintText: 'give your password here',
            prefixIcon: const Icon(Icons.lock),
            errorText: snapshot.error?.toString(),
          ),
          onChanged: bloc.changePassword,
        );
      });
}

Widget submitButton() {
  return ElevatedButton(onPressed: () {}, child: const Text('Submit'));
}
