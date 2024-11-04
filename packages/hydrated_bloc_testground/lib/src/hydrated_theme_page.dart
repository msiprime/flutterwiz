import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc_testground/hydrated_bloc_testground.dart';

///
class HydratedThemePage extends StatefulWidget {
  ///
  const HydratedThemePage({
    super.key,
  });

  @override
  State<HydratedThemePage> createState() => _HydratedThemePageState();
}

class _HydratedThemePageState extends State<HydratedThemePage> {
  String? time;

  @override
  void initState() {
    time = DateTime.now().toIso8601String();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hydrated Theme'),
      ),
      body: Center(
        child: BlocBuilder<HydratedThemeBloc, HydratedThemeState>(
          builder: (context, state) {
            return SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 20),
                Text('Hydrated Theme Page'),
                SizedBox(height: 20),
                Text(DateTime.now().toIso8601String()),
                Text(time!),
                (state is ThemeChanged)
                    ? Text('Theme: ${state.themeData.brightness}')
                    : Text('Theme: Light'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.dark_mode_outlined),
                      onPressed: () {
                        context
                            .read<HydratedThemeBloc>()
                            .add(DarkThemeSelectedEvent());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.light_mode_outlined),
                      onPressed: () {
                        context
                            .read<HydratedThemeBloc>()
                            .add(LightThemeSelectedEvent());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
