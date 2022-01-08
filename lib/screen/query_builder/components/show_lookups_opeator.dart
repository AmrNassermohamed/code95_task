import 'package:code95_task/constant/app_lookups.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:code95_task/screen/query_builder/components/show_lookups.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'drop_down_item.dart';

class ShowLookUpsOperator extends StatelessWidget {
  //const ShowLookUpsKey({Key? key}) : super(key: key);
  String text;
  int index;



  ShowLookUpsOperator({Key? key, required this.index,required this.text}) : super(key: key);
  //  second({Key? key, required this.showLookups,required this.text,required this.index,required this.lookUps,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    // TODO: implement build
    return  Consumer<QueryBuilderProvider>(
        builder: (context, provider, child)
        {
          return Column(children: [
            DropDownItem(text: text,
              index: index,
              lookUps: validationService.listQueryModel[index].sortSearch == 0
                  ? AppLookUps.operatorListString
                  : AppLookUps.operatorListInteger,
              callEventArrow: () {
                validationService.showLookups(index, 1);
              },),
            validationService.listQueryModel[index].showOperator == true
                ? ShowLookUps(
              lookupsModel: validationService.listQueryModel[index].sortSearch == 0
                  ? AppLookUps.operatorListString
                  : AppLookUps.operatorListInteger,
              indexQueryBuilder: index,
              sortLookUps: 1,)
                : const SizedBox.shrink(),
          ],);
        });
  }
}