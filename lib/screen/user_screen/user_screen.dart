import 'package:code95_task/components/avatar_icon.dart';
import 'package:code95_task/components/navigator.dart';
import 'package:code95_task/components/text_global.dart';
import 'package:code95_task/constant/app_color.dart';
import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:code95_task/screen/query_builder/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/item.dart';

class UserScreen extends StatefulWidget{
  const UserScreen({Key? key}) : super(key: key);

  @override
  UserScreenState createState() => UserScreenState();
}

class  UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }
  init() async {
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
  await  validationService.search();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UserBody();
  }
  
}

class UserBody extends StatelessWidget {
  const UserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<QueryBuilderProvider>(
        context, listen: false);
    return SafeArea(
        child: Scaffold(
            body:  Container(

              height: MediaQuery.of(context).size.height,
              color: AppColor.backGround,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          AppNavigator.navigateOff(context, QueryBuilder());
                        },
                        child: Row(children: const [
                          Icon(Icons.arrow_back)
                        ],),
                      ),
                      const SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Txt("Users ",bold: FontWeight.bold,textAlign: TextAlign.left,size: 32.0,weight:
                        FontWeight.w800,),]),
                      const SizedBox(height: 20,),
                      ListView.builder(

                          shrinkWrap: true,
                          itemCount: validationService.chosenList.length,
                          itemBuilder: (BuildContext context,int index){
                            return Item(title: validationService.chosenList[index].fullName,subTitle: validationService.chosenList[index].age.toString(),);
                          }
                      ),




                    ]),
              ),


            )));
  }


}



