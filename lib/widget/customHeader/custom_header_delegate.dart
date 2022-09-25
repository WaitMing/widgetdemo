import 'package:flutter/material.dart';

import '../../utils/Image_utils.dart';
import '../../generated/l10n.dart';

//  自定义头部代理
class CustomHeaderDelegate extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return avatar(context);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 128;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }

  ///   Author's  avatar
  avatar(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ImageUtils.getAssets('background_avatar',format: ImageFormat.jpg),
              fit: BoxFit.fill
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: ImageUtils.getAssets('panda_avatar'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              S.of(context).DeveloperName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}