import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fairwind/src/common/common.dart';


class AppContext extends StatelessWidget {
  const AppContext({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: 'FairWind',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
    );
  }
}
