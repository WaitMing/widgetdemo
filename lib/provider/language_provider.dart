import 'package:flutter/material.dart';

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