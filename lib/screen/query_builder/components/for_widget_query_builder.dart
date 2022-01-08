import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../index.dart';
import 'lookups_or_and.dart';

class ForWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Consumer<QueryBuilderProvider>(
        builder: (context, provider, child)
        {
          return Column(children: [
            for(int i = 0; i< provider.sizeSearch; i++)
              Column(children: [
                Query(index: i,),
                const SizedBox(height: 10,),
                Row(children: [
                  SizedBox(width: 100, child: LookUpsORAND(text: provider.listQueryModel[i].orAnd.key,index: i)),
                ],),
              ],)


          ],);
        });
  }
}