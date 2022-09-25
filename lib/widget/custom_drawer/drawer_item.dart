import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {

  final String text;
  final VoidCallback function;

  const DrawerItem({Key? key,required this.text,required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      height: 40,
      margin: const EdgeInsets.only(bottom: 10,left: 20,right: 20),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: function,
        child: Text(text),
      ),
    );
  }
}
