import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairwind/src/common/data/data.dart';

class DataProviderScope extends StatelessWidget {
  const DataProviderScope(
      {required this.child, super.key});


  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ILocalStorageDataProvider>(
      create: (context) => LocalStorageDataProvider(prefs: context.read()),
      child: child,
    );
  }
}
