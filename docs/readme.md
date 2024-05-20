# FairWind
## Деплой проекта на сервер CloudFlare

- Компилируем проект под web командой `flutter build web --target=lib/main_demo.dart`
- Архивируем содержимое папки `build/web`
- Переходим в раздел [Workers & Pages][wp]
- Нажимаем кнопку `Create new deployment`
- На открывшейся странице странице перетаскивем ранее созданный архив в блок `Drag and drop`
- Нажимаем кнопку `save and deploy`
- Обновления будут доступны сразу по [данному адресу][adrs]

[//]: #
[wp]: <https://dash.cloudflare.com/07b8a0d4af029178404c84a99321ae17/pages/view/fairwind-mlm>
[adrs]: <https://fairwind-mlm.pages.dev>