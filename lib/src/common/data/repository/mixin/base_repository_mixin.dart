import 'package:flutter/foundation.dart';

mixin BaseRepositoryMixin {
  Future<T> handleErrors<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } catch (exception, stackTrace) {
      // TODO: внедрить обработку ошибок
      // final error = exception.toString();
      // logger.e(exception, error, stackTrace);
      // if (exception is String) throw ApplicationException(exception);
      // throw ApplicationException(error);
      rethrow;
    }
  }
}