import 'package:code95_task/model/lookups.dart';

class AppLookUps {

static  List <LookupsModel> keyList=[LookupsModel(index: 0,key: "firstName", chosen: true),
    LookupsModel(key: "lastName", chosen:false,index: 1),
  LookupsModel(index: 2,key: "fullName", chosen: false),LookupsModel(index: 3,key: "age", chosen: false),
  LookupsModel(index: 3,key: "gender", chosen: false)];
 static List <LookupsModel> operatorListInteger=[
   LookupsModel(index: 0,key: "=", chosen:false),LookupsModel(index: 1,key:"!=" , chosen: false),LookupsModel(index: 2,key:">" , chosen: false),LookupsModel(index: 3,key: "<", chosen: false)];
 static List <LookupsModel> operatorListString=[LookupsModel(key: "StartWith", chosen:false,index:0 ),
   LookupsModel(key:"EndWith" , chosen: false,index:1 ),LookupsModel(key:"contains" , chosen: false,index:2 ),LookupsModel(index:3 ,key: "exact", chosen: false)];

static List <LookupsModel> operatorListORAND=[
  LookupsModel(key:"OR" , chosen: false,index:0 ),LookupsModel(key:"And" , chosen: false,index:2 )];

}