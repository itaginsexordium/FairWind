import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreDependenciesScope extends StatelessWidget {
  const CoreDependenciesScope(
      {required this.child, required this.sharedPreferences, super.key});

  final SharedPreferences sharedPreferences;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<SharedPreferences>.value(
      value: sharedPreferences,
      child: child,
    );
  }
}
