import 'package:code95_task/constant/app_lookups.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:code95_task/screen/query_builder/components/show_lookups.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../index.dart';
import 'drop_down_item.dart';

class LookUpsORAND extends StatelessWidget {
  //const ShowLookUpsKey({Key? key}) : super(key: key);
  String text;
  int index;



  LookUpsORAND({Key? key, required this.index,required this.text}) : super(key: key);
  //  second({Key? key, required this.showLookups,required this.text,required this.index,required this.lookUps,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    // TODO: implement build
    return Column(children: [
      DropDownItem( text: text, index: index, lookUps:AppLookUps.operatorListORAND,callEventArrow: (){
        validationService.showLookups(index, 2);
      },)  ,
      validationService.listQueryModel[index].showAddORJoin==true?
      ShowLookUps(lookupsModel:AppLookUps.operatorListORAND,indexQueryBuilder: index,sortLookUps:2 ,):const SizedBox.shrink(),
    ],);
  }
}