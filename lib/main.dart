import 'package:flutter/material.dart';
import 'package:widgetdemo/config/handle_error.dart';
import 'package:widgetdemo/personal_message.dart';

Future<void> main() async{

  /// 确保初始化正常
  WidgetsFlutterBinding.ensureInitialized();

  /// sp初始化
  
    

  /// 异常处理
  handleError(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  /// 初始化Dio
  
  /// Splash 机型适配
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: const PersonalMessage(),
    );
  }
}