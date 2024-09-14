import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flutter_bloc/flutter_bloc.dart";

import "../blocs/login_bloc.dart";

@RoutePage()
class LoginPage extends StatelessWidget
{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );
  }
}
