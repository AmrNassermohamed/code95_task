import 'package:code95_task/components/avatar_icon.dart';
import 'package:code95_task/components/text_global.dart';
import 'package:code95_task/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  String title;
  String subTitle;
  Item({Key? key, required this.title,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.only(top: 10),child: Container(

      padding:EdgeInsets.all(10),
      decoration:   BoxDecoration(
        border: Border.all(color: AppColor.white),

        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),

        color: AppColor.white,
      ),child: Row(children: [
      AvatarIcon(icon: Icon(Icons.person,color: AppColor.black,size: 15,),color: AppColor.black,),
      SizedBox(width: 20,),
      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Txt(title,bold: FontWeight.bold,textAlign: TextAlign.left,size: 17.0,weight:
        FontWeight.bold,),
        SizedBox(height: 10,),

        Txt(subTitle,bold: FontWeight.normal,textAlign: TextAlign.start,size: 16.0,weight:
        FontWeight.normal,),

      ],)


    ],) ,));
  }


}

