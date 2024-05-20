import 'dart:convert';
import 'package:fairwind/src/common/common.dart';
import '../model/models.dart';

abstract interface class IUserStorageRepository {
  UserModel? getUser();

  Future<bool> saveUser(UserModel user);

  Future<bool> removeUser();
}

final class UserStorageRepository
    with BaseRepositoryMixin
    implements IUserStorageRepository {
  const UserStorageRepository(
      {required final ILocalStorageDataProvider localStorageDataProvider})
      : _localStorageDataProvider = localStorageDataProvider;

  final ILocalStorageDataProvider _localStorageDataProvider;

  final String _userKeyForPrefs = Keys.userKeyForPrefs;

  @override
  UserModel? getUser() {
    final result = _localStorageDataProvider.getString(_userKeyForPrefs);
    if (result == null) return null;
    return UserModel.fromJson(jsonDecode(result));
  }

  @override
  Future<bool> saveUser(UserModel user) async {
    return _localStorageDataProvider.setString(
        _userKeyForPrefs,
        //TODO: проверить работоспособность jsonEncode, раскодирует ли обратно
        jsonEncode(user));
  }

  @override
  Future<bool> removeUser() {
    return _localStorageDataProvider.remove(_userKeyForPrefs);
  }
}

final class FakeUserStorageRepository implements IUserStorageRepository {
  const FakeUserStorageRepository(
      {required final ILocalStorageDataProvider localStorageDataProvider})
      : _localStorageDataProvider = localStorageDataProvider;

  final ILocalStorageDataProvider _localStorageDataProvider;

  @override
  UserModel? getUser() {
    return const UserModel(
        id: 1,
        firstName: 'Stan',
        lastName: 'Kovalsky',
        email: 'fdsfd@mail.ru',
        userRoleType: UserRoleType.admin,
        correspondenceLanguage: 'ru');
  }

  @override
  Future<bool> removeUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> saveUser(UserModel user) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
