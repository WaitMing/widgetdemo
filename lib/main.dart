import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:widgetdemo/config/handle_error.dart';
import 'package:widgetdemo/personal_message.dart';
import 'package:widgetdemo/provider/language_provider.dart';
import 'package:widgetdemo/provider/theme_color_provider.dart';
import 'generated/l10n.dart';

Future<void> main() async{

  /// 确保初始化正常
  WidgetsFlutterBinding.ensureInitialized();

  /// sp初始化

  /// 异常处理
  handleError(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  /// 初始化Dio
  
  /// Splash 机型适配

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeColorProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider())
      ],
      child: Consumer2<ThemeColorProvider,LanguageProvider>(
        builder: (_,ThemeColorProvider themeColorProvider,LanguageProvider languageProvider,__){
          return MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.blue
            ),
            //  国际化
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: languageProvider.value,
            supportedLocales: S.delegate.supportedLocales,
            home: const PersonalMessage(),
          );
        },
      ),
    );
  }
}