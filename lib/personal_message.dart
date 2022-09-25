import 'package:flutter/material.dart';
import 'package:widgetdemo/widget/customHeader/custom_header.dart';
import 'package:widgetdemo/widget/custom_drawer/custom_drawer.dart';


//  个人信息
class PersonalMessage extends StatelessWidget {

  const PersonalMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "APP demo"
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: onScrollerEven,
        child: CustomScrollView(
          slivers: [
            CustomHeader(),
            SliverPadding(padding: EdgeInsets.only(top: 20)),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 1000,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  雷达图
  abilityCanvas(BuildContext context){
    return SliverPadding(
        padding: EdgeInsets.zero,
        sliver: Container(
          width: 400,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white12
          ),
        ),
    );
  }

  //  滑动时触发
  bool onScrollerEven(ScrollNotification scrollNotification){
    return false;
  }

}