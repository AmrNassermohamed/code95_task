import 'package:code95_task/components/avatar_icon.dart';
import 'package:code95_task/components/text_global.dart';
import 'package:code95_task/constant/app_color.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../index.dart';

class InFront extends StatelessWidget {
  const InFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    // TODO: implement build
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.height/12,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Txt("Query Builder",bold: FontWeight.bold,textAlign: TextAlign.left,size: 32.0,weight:
        FontWeight.w800,),
        InkWell(onTap: (){

          controller.add( TextEditingController());
          validationService.addQuery();
        },child:
        AvatarIcon(icon: const Icon(Icons.add ,size: 15,color: AppColor.green,),
          color: AppColor.green,)),
      ],)
    ],);
  }
}