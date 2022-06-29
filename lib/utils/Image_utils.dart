import 'dart:ui';

import 'package:flutter/material.dart';

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