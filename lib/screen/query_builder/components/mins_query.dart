import 'package:code95_task/components/avatar_icon.dart';
import 'package:code95_task/constant/app_color.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinsQuery extends StatelessWidget {
  const MinsQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return    InkWell(onTap: (){
      final validationService = Provider.of<QueryBuilderProvider>(
          context, listen: false);
      validationService.minsQuery();
    },child:
    AvatarIcon(icon: const Icon(Icons.minimize ,size: 15,color: AppColor.red,),
      color: AppColor.red,));
  }



}