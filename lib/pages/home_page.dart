import 'package:flutter/material.dart';
import 'package:flutter_exploring/features/counter_bloc/pages/counter_bloc_screen.dart';
import 'package:flutter_exploring/features/user/presentation/pages/users_page.dart';
import 'package:flutter_exploring/pages/custom_scroll_view.dart';
import 'package:flutter_exploring/pages/formz_checking_page.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';
import 'package:gap/gap.dart';
import 'package:hydrated_bloc_testground/hydrated_bloc_testground.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test Ground Main'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            GoTo(page: UsersPage(), pageName: 'Users'),
            Gap(8),
            GoTo(page: HydratedThemePage(), pageName: 'Hydrated Theme'),
            Gap(8),
            GoTo(
                page: CustomScrollViewExample(),
                pageName: 'Custom Scroll View Example'),
            Gap(8),
            GoTo(
                page: CounterBlocScreen(),
                pageName: 'Simple Counter With Bloc'),
            Gap(8),
            GoTo(page: FormzCheckingPage(), pageName: 'Formz play ground')
          ],
        ),
      ),
    );
  }
}
