import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/login/view/componenet2.dart';
import 'package:flutter_exploring/login/view/component.dart';
import 'package:form_inputs/form_inputs.dart';

import '../login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _EmailInput(),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 6),
                  AppButton.blueDress(
                    onPressed: () {},
                    child: const Text('Forgot password?'),
                  ),
                  const SizedBox(height: 12),
                  AppButton.darkAqua(
                    child: const Text('Log in'),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  AppButton.transparentDarkAqua(
                    child: const Text('Create an account'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatefulWidget {
  const _EmailInput();

  @override
  State<_EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<_EmailInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;

    return AppEmailTextField(
      key: const Key('loginWithEmailForm_emailInput_textField'),
      controller: _controller,
      readOnly: state.status.isInProgress,
      hintText: 'Email',
      onChanged: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
