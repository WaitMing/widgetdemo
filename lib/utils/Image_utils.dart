// NOTE: Unused imports do not affect the operation of the program, but for cleanliness it is better to remove them.
import 'dart:ui';

import 'package:flutter/material.dart';

// NOTE: TODO: https://pub.dev/packages/flutter_gen
// This code is an attempt to do something that has been implemented for a long time.
// There are tools that simplify working with assets at times, and with
// strict typing, you will be able to find errors when working with assets at the compilation stage.
// So you will never lose the asset.
class ImageUtils{

  ///   获取 image path
  static String getImagePath(String imageName,{ImageFormat format = ImageFormat.png}){
    return 'assets/images/$imageName.${format.value}';
  }

  ///   获取网络图片
  static ImageProvider getAssets(String imageName,{ImageFormat format = ImageFormat.png}){
    return AssetImage(getImagePath(imageName,format: format));
  }

  ///   缓存图片
  
}

///   图片格式
enum ImageFormat{
  png,
  jpg,
}

extension ImageFormatExtension  on ImageFormat{
  get value => ['png','jpg',][index];
}