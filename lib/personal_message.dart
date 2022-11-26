import 'package:flutter/material.dart';
import 'package:widgetdemo/widget/customHeader/custom_header.dart';
import 'package:widgetdemo/widget/custom_drawer/custom_drawer.dart';

//  个人信息
class PersonalMessage extends StatelessWidget {
  const PersonalMessage({Key? key}) : super(key: key);

  // NOTE: Nested code on Flutter can be quite wide and this is normal.
  // Allow the code to be more than 200 characters and it will not be so compressed.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APP demo"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: onScrollerEven,
        child: CustomScrollView(
          slivers: [
            // NOTE: Try to use const wherever possible.
            // Flutter will automatically save resources used by the program.
            const CustomHeader(),
            const SliverPadding(
              padding: EdgeInsets.only(top: 20),
            ),
            // NOTE: A rather large widget, it should be pulled out in a separate
            // method or a full-fledged widget.
            grid(),
          ],
        ),
      ),
    );
  }

  // NOTE: It will be easier to work with him here.
  SliverGrid grid() {
    return SliverGrid(
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
    );
  }

  //  雷达图
  // NOTE: Initially Flutter tried to be similar to dynamic languages,
  // but then they decided to use static typing.
  // Static typing allows you to find problems at the compilation stage.
  // Static typing is stricter, but also more useful for analyzing, understanding code and finding errors.
  // TODO: Read about the pros and cons of static typing compared to dynamic typing.
  // One of the articles: https://www.baeldung.com/cs/statically-vs-dynamically-typed-languages
  Widget abilityCanvas(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.zero,
      sliver: Container(
        width: 400,
        height: 250,
        decoration: const BoxDecoration(color: Colors.white12),
      ),
    );
  }

  //  滑动时触发
  bool onScrollerEven(ScrollNotification scrollNotification) {
    return false;
  }
}
