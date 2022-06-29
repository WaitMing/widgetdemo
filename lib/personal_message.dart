import 'package:flutter/material.dart';
import 'package:widgetdemo/utils/Image_utils.dart';

//  个人信息
class PersonalMessage extends StatelessWidget {

  const PersonalMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "作者信息"
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          avatar(context),
          des()
        ],
      ),
    );
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
            child: const Text(
              '夜雨',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }

  ///  Personal Des
  des(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: const Text(
          'Flutter Developer'
      ),
    );
  }

}