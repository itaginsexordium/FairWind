import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:fairwind/src/common/common.dart';
import 'platform_initializer/initialization_stub.dart'
    if (dart.library.io) 'platform_initializer/initialization_vm.dart'
    if (dart.library.html) 'platform_initializer/initialization_js.dart'
    as platform_runner;
import '../app.dart';

/// Инициализация и запуск приложения
class Runner {
  static Future<void> run(AppEnvironment appEnvironment) {
    //: возможно стоит заложить таймер времени инициализации приложения
    // и отправлять в аналитику/крашлитику когда время большое
    return bootstrap(
      appEnvironment: appEnvironment,
      appRunner: () => _appRunner(appEnvironment),
    );
  }

  static Future<Widget> _appRunner(AppEnvironment appEnvironment) async {
    // удаление # из URL, пакет сырой не уверен нужно ли
    setPathUrlStrategy();

    // : удалить если фаербейз не будет использоваться
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    if (ClientPlatform.clientPlatformType == ClientPlatformType.mobile) {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);

      // : удалить если уведомления от фаербейза заменим на что-либо
      // Установка точки входа в фоновый процесс управления уведомлениями
      // FirebaseMessaging.onBackgroundMessage(shadow);
      // onMessage = FirebaseMessaging.onMessage;
      // onMessage.listen(действие на пуш);
      // await setupFlutterNotifications(); - настроить
      // if (kDebugMode) {
      //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      // } else {
      //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      // }
      // Хороший пример в DLS
    }

    // Платформенная часть раннера
    await platform_runner.run(appEnvironment);

    // : не изящное решение, но хотелось шаредпрефс запихнуть в контекст
    // Подумать возможно заменить
    final sharedPreferences = await SharedPreferences.getInstance();
    return CoreDependenciesScope(
      sharedPreferences: sharedPreferences,
      child: const DataProviderScope(
        child: RepositoryScope(
            child: BlocScope(
          child: AppContext(),
        )),
      ),
    );
  }
}
