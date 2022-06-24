import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:widgetdemo/config/app_config.dart';

//  捕捉全局异常
void handleError(void Function() body){

  FlutterError.onError = (FlutterErrorDetails details){
      if(AppConfig.inProduction){
        //  debug 模式 直接打印 FlutterError
        FlutterError.dumpErrorToConsole(details);
      }else{
        //  release 时，异常交给 Zone 统一处理
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      }  
  };

  runZonedGuarded(body, (Object error,StackTrace stackTrace) async{
    await _report(error, stackTrace);
  });
}

Future<void> _report(Object error,StackTrace stackTrace) async{
  if(AppConfig.inProduction){
    debugPrintStack(
      stackTrace: stackTrace,
      label: error.toString(),
      maxFrames: 100
    );
  }else{
    //  将异常收集上传至服务器

  }
} 