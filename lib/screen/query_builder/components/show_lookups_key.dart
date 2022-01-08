import 'package:code95_task/model/lookups.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:code95_task/screen/query_builder/components/show_lookups.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


import 'drop_down_item.dart';

class ShowLookUpsKey extends StatelessWidget {
  //const ShowLookUpsKey({Key? key}) : super(key: key);
  String text;
  int index;
  List <LookupsModel> lookUps;
  bool showLookups;

  ShowLookUpsKey({Key? key, required this.index,required this.showLookups,required this.text,required this.lookUps}) : super(key: key);
  //  second({Key? key, required this.showLookups,required this.text,required this.index,required this.lookUps,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    // TODO: implement build
    return Column(children: [
      DropDownItem( text: text, index: index, lookUps: lookUps,callEventArrow: (){
        validationService.showLookups(index, 0);
      },)  ,
      validationService.listQueryModel[index].showKey==true?  ShowLookUps(lookupsModel: lookUps,indexQueryBuilder: index,sortLookUps: 0,):const SizedBox.shrink(),
    ],);
  }
}