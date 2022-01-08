import 'package:code95_task/components/text_global.dart';
import 'package:code95_task/model/lookups.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowLookUps extends StatelessWidget{
  late List <LookupsModel> lookupsModel;
  int indexQueryBuilder;
  int sortLookUps;

  ShowLookUps({required this.sortLookUps,required this.lookupsModel,required this.indexQueryBuilder});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    return  Consumer<QueryBuilderProvider>(
        builder: (context, provider, child)
        {
          return Column(children: [
            for(int i = 0; i < lookupsModel.length; i++)
              lookupsModel[i].chosen == false ? InkWell(onTap: () {
                // lookupsModel[i].chosen=true;
                //lookupsModel[validationService. listQueryModel[indexQueryBuilder].operator.index].chosen=false;

                validationService.chooseValue(
                    indexQueryBuilder, sortLookUps, lookupsModel[i], i);
              },
                  child: Txt(lookupsModel[i].key, bold: FontWeight.normal,
                    textAlign: TextAlign.left,
                    size: 16.0,
                    weight:
                    FontWeight.w800,)) : const SizedBox(height: 0,)
          ],);
        });
  }
}