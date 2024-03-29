import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:widgetdemo/core/radar_chart/example/radar_chart_example.dart';
import 'package:widgetdemo/generated/l10n.dart';
import 'package:widgetdemo/provider/language_provider.dart';
import 'package:widgetdemo/provider/theme_color_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// 初始化Dio

  /// Splash 机型适配

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeColorProvider()), ChangeNotifierProvider(create: (_) => LanguageProvider())],
      child: Consumer2<ThemeColorProvider, LanguageProvider>(
        builder: (_, ThemeColorProvider themeColorProvider, LanguageProvider languageProvider, __) {
          return MaterialApp(
            theme: ThemeData(primaryColor: Colors.blue),
            //  国际化
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: languageProvider.value,
            supportedLocales: S.delegate.supportedLocales,
            home: RadarChartExample(),
          );
        },
      ),
    );
  }
}
