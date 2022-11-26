import 'package:flutter/material.dart';
import 'package:widgetdemo/config/handle_error.dart';
import 'package:widgetdemo/core/application.dart';

Future<void> main() async {
  /// 确保初始化正常
  WidgetsFlutterBinding.ensureInitialized();

  /// sp初始化

  /// 异常处理
  handleError(() => runApp(const MyApp()));
}
