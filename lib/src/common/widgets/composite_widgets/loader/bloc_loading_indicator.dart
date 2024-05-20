import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairwind/src/common/bloc/loadable_bloc.dart';
import 'loader_scope.dart';


class BlocLoadingIndicator<Bloc extends LoadableBloc<Object, LoadableState>>
    extends StatelessWidget {
  const BlocLoadingIndicator({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<Bloc, LoadableState>(
      listenWhen: (previous, current) => current.isLoading,
      listener: (context, state) => LoaderScope.showLoaderOf(
        context,
        future: context.read<Bloc>().firstNotLoading,
      ),
      child: child,
    );
  }
}
