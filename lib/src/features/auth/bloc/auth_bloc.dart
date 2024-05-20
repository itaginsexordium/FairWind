import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fairwind/src/features/auth/model/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fairwind/src/common/bloc/bloc_action_performer_mixin.dart';
import '../data/user_storage_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with BlocActionPerformerMixin {
  AuthBloc({required IUserStorageRepository userStorageRepository})
      : _userStorageRepository = userStorageRepository,
        super(const AuthState.processing(null)) {
    on<AuthEvent>(
      (event, emit) => event.map(
        init: (event) => _onInit(event, emit),
      ),
      transformer: sequential(),
    );
  }

  final IUserStorageRepository _userStorageRepository;

  Future<void> _onInit(_InitAuthEvent event, Emitter<AuthState> emit) async {
    UserModel? user = _userStorageRepository.getUser();
    emit(user == null
        ? const AuthState.notAuthenticated()
        : AuthState.authenticated(user));
  }

  @override
  Future<void> handleError(
      Object error, StackTrace stackTrace, Emitter<AuthState> emitter) {
    // TODO: implement handleError
    throw UnimplementedError();
  }
}
