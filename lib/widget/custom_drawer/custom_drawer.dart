import 'package:flutter/material.dart';
import 'package:widgetdemo/utils/Image_utils.dart';
import '../../generated/l10n.dart';
import 'drawer_item.dart';

//  自定义抽屉
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

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