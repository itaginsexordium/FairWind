import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairwind/src/features/auth/data/user_storage_repository.dart';

class RepositoryScope extends StatelessWidget {
  const RepositoryScope(
      {required this.child, super.key});


  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IUserStorageRepository>(
      create: (context) => FakeUserStorageRepository(localStorageDataProvider: context.read()),
      child: child,
    );
  }
}
