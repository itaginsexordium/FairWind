import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoadableState {
  bool get isLoading;
}

mixin LoadableBloc<Event, State extends LoadableState> on Bloc<Event, State> {
  Future<State> get firstNotLoading =>
      stream.firstWhere((state) => !state.isLoading);
}
