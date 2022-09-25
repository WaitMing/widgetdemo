import 'package:flutter/material.dart';

import 'custom_header_delegate.dart';

//  自定义头部
class CustomHeader extends StatefulWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,   //  是否吸顶
      delegate: CustomHeaderDelegate(),
    );
  }
}
