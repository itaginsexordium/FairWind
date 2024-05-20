import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairwind/src/features/auth/bloc/auth_bloc.dart';

class BlocScope extends StatelessWidget {
  const BlocScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(userStorageRepository: context.read()),
      child: child,
    );
  }
}
