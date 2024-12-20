import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/login/view/date_time_extension.dart';
import 'package:flutter_exploring/login/view/signup_page.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';

final TextEditingController emailController = TextEditingController();

final TextEditingController passController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: LoginView(),
    );
  }
}

AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
final flutterSecureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
  encryptedSharedPreferences: true,
));

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final SecureStorage storage = SecureStorage(flutterSecureStorage);
  String value = '';
  String value2 = '';

  @override
  void initState() {
    super.initState();
  }

  void retrieveValue() async {
    value = await storage.read(key: emailController.text) ?? '';
    final storage2 = PersistentStorage(
        sharedPreferences: await SharedPreferences.getInstance());
    value2 = await storage2.read(key: emailController.text) ?? '';
    setState(() {});
    log(value);
  }

  Future<void> writeValue() async {
    final storage2 = PersistentStorage(
        sharedPreferences: await SharedPreferences.getInstance());
    storage.write(
      key: emailController.text,
      value: passController.text,
    );
    storage2.write(
      key: emailController.text,
      value: passController.text,
    );
  }

  void deleteValue() async {
    final storage2 = PersistentStorage(
        sharedPreferences: await SharedPreferences.getInstance());
    await storage.delete(key: emailController.text);
    await storage2.delete(key: emailController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 12, 16, 20),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                            ),
                            const SizedBox(height: 26),
                            Center(
                              child: Text(value2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                            ),
                            const SizedBox(height: 26),
                            Text(DateTime.now().mDY,
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            const SizedBox(height: 6),
                            _EmailInput(),
                            const SizedBox(height: 12),
                            _PassInput(),
                            const SizedBox(height: 6),
                            FilledButton(
                              child: const Text('Create an account'),
                              onPressed: () {
                                if ((formKey.currentState?.validate() ??
                                    false)) {
                                  writeValue();
                                }
                              },
                            ),
                            const SizedBox(height: 6),
                            OutlinedButton(
                              onPressed: retrieveValue,
                              child: const Text('Retrieve Value'),
                            ),
                            OutlinedButton(
                              onPressed: deleteValue,
                              child: const Text('Delete Value'),
                            ),
                            GoTo(
                              pageName: 'Sign Up',
                              page: SignUpScreen(),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
      validator: (value) {
        final email = Email.dirty(value ?? '');
        return email.errorMessage;
      },
    );
  }
}

class _PassInput extends StatelessWidget {
  const _PassInput();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
      validator: (value) {
        final email = Password.dirty(value ?? '');
        return email.errorMessage;
      },
    );
  }
}
