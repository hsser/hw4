import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw4/blocs/authentication/bloc/authentication_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: FilledButton(
          child: const Text("Login"),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context)
                .add(AuthenticationLoginEvent());
          },
        )),
      ),
    );
  }
}
