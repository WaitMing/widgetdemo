import 'package:flutter/material.dart';


// NOTE: Аналогично, есть хорошая система переводов в GetX.
// https://blog.devgenius.io/flutter-internationalization-i18n-with-getx-d3a6465d1282
// https://github.com/jonataslaw/getx/blob/master/README.md#internationalization
class LanguageProvider extends ChangeNotifier{

  Locale defaultLocal = const Locale('zh','CN');

  Locale get value{
      //  从内存获取

      return defaultLocal;
  }

  void setLocale(String locale){
    //  将配置的语言配置放入内存

    notifyListeners();
  }

}