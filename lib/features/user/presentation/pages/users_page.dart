import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/features/user/data/data_sources/user_ds.dart';
import 'package:flutter_exploring/features/user/data/repositories/user_repo_impl.dart';
import 'package:flutter_exploring/features/user/domain/use_cases/user_usecase.dart';
import 'package:flutter_exploring/features/user/presentation/manager/user_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(
        GetUsers(
          UserRepoImpl(UserDSImpl(Dio())),
        ),
      )..add(FetchUsers()),
      // create: (_) => ServiceProvider.get<UserBloc>(),
      child: const UserView(),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          switch (state) {
            case UserInitial():
              return const Center(child: CircularProgressIndicator());
            case UserLoading():
              return const Center(child: CircularProgressIndicator());
            case UserLoaded():
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                  );
                },
              );
            case UserError():
              return Center(
                child: Text(state.message),
              );
            default:
              return const SizedBox.shrink();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
