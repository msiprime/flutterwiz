import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_testground/src/blocs/app_theme.dart';

part 'hydrated_theme_event.dart';

part 'hydrated_theme_state.dart';

class HydratedThemeBloc
    extends HydratedBloc<HydratedThemeEvent, HydratedThemeState>
    with WidgetsBindingObserver {
  HydratedThemeBloc() : super(const HydratedThemeInitial()) {
    on<DarkThemeSelectedEvent>(_onDarkThemeSelectedEvent);
    on<LightThemeSelectedEvent>(_onLightThemeSelectedEvent);
    on<SystemThemeSelectedEvent>(_onSystemThemeSelectedEvent);

    WidgetsBinding.instance.addObserver(this);

    add(SystemThemeSelectedEvent(
      brightness: WidgetsBinding.instance.platformDispatcher.platformBrightness,
    ));
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    add(SystemThemeSelectedEvent(brightness: brightness));
  }

  FutureOr<void> _onDarkThemeSelectedEvent(
    DarkThemeSelectedEvent event,
    Emitter<HydratedThemeState> emit,
  ) {
    emit(ThemeChanged(themeData: AppTheme.darkTheme));
  }

  FutureOr<void> _onLightThemeSelectedEvent(
    LightThemeSelectedEvent event,
    Emitter<HydratedThemeState> emit,
  ) {
    emit(ThemeChanged(themeData: AppTheme.lightTheme));
  }

  FutureOr<void> _onSystemThemeSelectedEvent(
    SystemThemeSelectedEvent event,
    Emitter<HydratedThemeState> emit,
  ) {
    // Emit the correct theme based on system brightness
    if (event.brightness == Brightness.dark) {
      emit(ThemeChanged(themeData: AppTheme.darkTheme));
    } else {
      emit(ThemeChanged(themeData: AppTheme.lightTheme));
    }
  }

  @override
  HydratedThemeState? fromJson(Map<String, dynamic> json) {
    final themeString = json['theme'] as String;
    ThemeData themeData;

    if (themeString == 'dark') {
      themeData = AppTheme.darkTheme;
    } else {
      themeData = AppTheme.lightTheme;
    }
    return ThemeChanged(themeData: themeData);
  }

  @override
  Map<String, dynamic>? toJson(HydratedThemeState state) {
    String themeString;
    if ((state as ThemeChanged).themeData.brightness == Brightness.dark) {
      themeString = 'dark';
    } else {
      themeString = 'light';
    }
    return {'theme': themeString};
  }
}
