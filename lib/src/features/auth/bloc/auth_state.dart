part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.processing(UserModel? user) = ProcessingAuthState;

  const factory AuthState.authenticated(UserModel user) =
      AuthenticatedAuthState;

  const factory AuthState.notAuthenticated() =
      NotAuthenticatedAuthState;

  bool get isAuthenticated {
    return when(
      authenticated: (user) => true,
      processing: (user) => user != null,
      notAuthenticated: () => false,
    );
  }
}
