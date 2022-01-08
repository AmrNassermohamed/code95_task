import 'package:code95_task/components/text_global.dart';
import 'package:code95_task/constant/app_color.dart';
import 'package:code95_task/model/lookups.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownItem extends StatelessWidget {
  String text;
  int index;
  List <LookupsModel> lookUps;

  Function callEventArrow;
  DropDownItem({Key? key,required this.callEventArrow  ,required this.text,required this.index,required this.lookUps,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);

    // TODO: implement build
    return  Container(

        padding: const EdgeInsets.only(left: 10),
        decoration:   BoxDecoration(
          border: Border.all(color: AppColor.mainColor),

          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),

          color: AppColor.white,
        ),child:Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

        Txt(text,bold: FontWeight.normal,textAlign: TextAlign.left,size: 16.0,weight:
        FontWeight.w800,),
        InkWell(onTap: (){
          callEventArrow();
        },child: const Icon(Icons.arrow_drop_down,color: AppColor.black,))
      ],) ,



    ],) );
  }

}