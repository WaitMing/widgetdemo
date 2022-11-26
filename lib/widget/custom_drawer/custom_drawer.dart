import 'package:flutter/material.dart';
import 'package:widgetdemo/utils/Image_utils.dart';

// NOTE: Relative paths are undesirable to use (my personal opinion).
// It's nicer to see absolute paths.
import 'package:widgetdemo/generated/l10n.dart';

import 'drawer_item.dart';

//  自定义抽屉
// NOTE: I stopped using Stateful widgets because they force
// to implement the update logic directly into widgets, this worsens readability.
// By the way, there is no setState update here. So the widget can be safely converted to Stateless.
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white38,
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ImageUtils.getAssets('drawer_background',format: ImageFormat.jpg),
                        fit: BoxFit.fill
                    )
                ),
              )
          ),
          //  设置
          DrawerItem(text: S.of(context).Setting,function: (){

          }),
          DrawerItem(text: S.of(context).About,function: (){

          }),
        ],
      ),
    );
  }
}