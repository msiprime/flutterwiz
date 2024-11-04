import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'hydrated_theme_event.dart';
part 'hydrated_theme_state.dart';

///
class HydratedThemeBloc
    extends HydratedBloc<HydratedThemeEvent, HydratedThemeState> {
  ///
  HydratedThemeBloc() : super(const HydratedThemeInitial()) {
    on<DarkThemeSelectedEvent>(_onDarkThemeSelectedEvent);
    on<LightThemeSelectedEvent>(_onLightThemeSelectedEvent);
    on<SystemThemeSelectedEvent>(_onSystemThemeSelectedEvent);
  }

  FutureOr<void> _onDarkThemeSelectedEvent(
    DarkThemeSelectedEvent event,
    Emitter<HydratedThemeState> emit,
  ) {
    emit(ThemeChanged(themeData: ThemeData.dark()));
  }

  FutureOr<void> _onLightThemeSelectedEvent(
    LightThemeSelectedEvent event,
    Emitter<HydratedThemeState> emit,
  ) {
    emit(ThemeChanged(themeData: ThemeData.light()));
  }

  FutureOr<void> _onSystemThemeSelectedEvent(
    SystemThemeSelectedEvent event,
    Emitter<HydratedThemeState> emit,
  ) {
    // Implement system theme logic if needed
  }

  @override
  HydratedThemeState? fromJson(Map<String, dynamic> json) {
    log('from json method is invoked');

    // Retrieve the theme as a string and convert it back to ThemeData
    final themeString = json['theme'] as String;
    ThemeData themeData;

    log(themeString);

    if (themeString == 'dark') {
      themeData = ThemeData.dark();
    } else if (themeString == 'light') {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.light();
    }

    return ThemeChanged(themeData: themeData);
  }

  @override
  Map<String, dynamic>? toJson(HydratedThemeState state) {
    log('to json method is invoked');

    // Convert ThemeData to a simple string for serialization
    String themeString;

    if ((state as ThemeChanged).themeData.brightness == Brightness.dark) {
      themeString = 'dark';
    } else if (state.themeData.brightness == Brightness.light) {
      themeString = 'light';
    } else {
      themeString = 'system';
    }

    log('printing the value from storage');
    log({'theme': themeString}.toString());

    return {'theme': themeString};
  }
}
