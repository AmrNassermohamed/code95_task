import 'package:code95_task/components/avatar_icon.dart';
import 'package:code95_task/components/button_global.dart';
import 'package:code95_task/components/navigator.dart';
import 'package:code95_task/components/text_field_global.dart';
import 'package:code95_task/components/text_global.dart';
import 'package:code95_task/constant/app_color.dart';
import 'package:code95_task/constant/app_lookups.dart';
import 'package:code95_task/model/lookups.dart';
import 'package:code95_task/model/query_build_model.dart';
import 'package:code95_task/model/user.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:code95_task/screen/user_screen/user_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'components/for_widget_query_builder.dart';
import 'components/in_front.dart';
import 'components/lookups_or_and.dart';
import 'components/mins_query.dart';
import 'components/show_lookups.dart';
import 'components/show_lookups_key.dart';
import 'components/show_lookups_opeator.dart';


class QueryBuilder extends StatefulWidget{
  @override
  QueryBuilderState createState() => QueryBuilderState();
}
  List  <TextEditingController> controller=[TextEditingController()];
class QueryBuilderState extends State<QueryBuilder> {

init() async {
  final validationService = Provider.of<QueryBuilderProvider>(
      context, listen: false);
await validationService.getRepo();
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
init();
}

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

}

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BodyQuery();
  }

}

class BodyQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    return SafeArea(
      child: Scaffold(
        body:
        Container(
          color: AppColor.white,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InFront(),
                const SizedBox(height: 20,),
                ForWidget(),
                const SizedBox(height: 10,),
                customElevatedButtonWithIcon(context,title: "t",function: (){
                  validationService.listen();
                  validationService.controllerText=[];
                  for(int i=0;i<validationService.sizeSearch;i++){

                    validationService.controllerText.add(controller[i].text);
                  }
                  AppNavigator.navigateTo(context, UserScreen());

                },height: 50)
              ],
            ),
          ),
        ),
      ),

    );
  }


}





















class Query extends StatelessWidget {

  int index;

  Query({Key? key,  required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    // TODO: implement build
  return  Container(
      padding: const EdgeInsets.all(20.0),
      decoration:   BoxDecoration(
        borderRadius:  const BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: AppColor.lightGrey200,
      ),
      child: Column(children: [
     index>0?  const MinsQuery():const SizedBox(height: 0,),
        const SizedBox(height: 20,),
        Row(children: [

          Expanded(child: ShowLookUpsKey(showLookups: false,text: validationService.listQueryModel[index].key.key,index: index,lookUps: AppLookUps.keyList,)),
          const SizedBox(width: 10,),
         ShowLookUpsOperator(text:validationService.listQueryModel[index].operator.key ,index: index,),
        ],),


        const SizedBox(height: 10,),

        Container(

            width: MediaQuery.of(context).size.width-80,
            //constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
            child:   TextFieldGlobal(type: 1,
                controller: controller[index], hint:validationService.listQueryModel[index].key.key)
        ),
        const SizedBox(height: 10,),







      ]),

    );
  }


}



