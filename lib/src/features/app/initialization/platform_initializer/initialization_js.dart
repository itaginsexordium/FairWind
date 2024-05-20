// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../../app.dart';

Future<void> run(AppEnvironment appEnvironment) async {
  Future<void>.delayed(
    const Duration(seconds: 1),
    () {
      //TODO: настроить правильным образом, это заготовка для удаления ненужных элементов
      // html.document.getElementById('splash')?.remove();
      // html.document.getElementById('splash-branding')?.remove();
      // html.document.body?.style.background = 'transparent';
      // html.document
      //     .getElementsByClassName('splash-loading')
      //     .toList(growable: false)
      //     .forEach((element) => element.remove());
    },
  );
}
