
import 'package:code95_task/constant/app_lookups.dart';
import 'package:code95_task/data/data_query_builder.dart';
import 'package:code95_task/model/lookups.dart';
import 'package:code95_task/model/provider_general_state.dart';
import 'package:code95_task/model/query_build_model.dart';
import 'package:code95_task/model/user.dart';
import 'package:code95_task/utils/process_integer.dart';
import 'package:code95_task/utils/process_string.dart';
import 'package:flutter/cupertino.dart';

class QueryBuilderProvider extends ChangeNotifier {
int sizeSearch=1;
List <LookupsModel> lookUpsShow=[];
int queryBuilderIndex=0;
List <String> controllerText=[];
late ProviderGeneralState<List <UserModel>> listUserState;
late List <QueryBuilderModel> listQueryModel=[
  QueryBuilderModel(value: AppLookUps.keyList[0].key, key: AppLookUps.keyList[0], operator: AppLookUps.operatorListString[0],
    sortOperator: "=",showOperator: false,showKey: false,showAddORJoin: false,sortSearch: 0,orAnd: AppLookUps.operatorListORAND[0]),
 ];
List<UserModel>  userList=[UserModel(age: 12,fullName: "amr nasser",gender: 0,lastMame: "nasser",userId: 1,firstName: "amr"),UserModel(age: 17, fullName: "Ahmed mohamed", firstName: "ahmed", gender: 1, lastMame: "mohamed", userId: 2)];
List <UserModel> chosenList=[];
getRepo() async {
  try {
    List <UserModel> repoList;
    setWaiting();
    repoList = await DataQueryBuilder().getDataUser();
    listUserState = ProviderGeneralState(data: repoList, hasData: true);
    userList=listUserState.data!;
    print(userList.length);
    notifyListeners();
  }catch(ex){
    setError(ex.toString());
    rethrow;
  }
}

setWaiting(){
  listUserState=ProviderGeneralState(waiting: true);
}

setError(error){
  listUserState=ProviderGeneralState(error:error,hasError: true );
}
search(){
chosenList=[];
  List<UserModel> chosen=[];
  chosenList=userList;
  for(int i=0;i<sizeSearch;i++){
   chosen=switchKey(listQueryModel[i],controllerText[i]);
  if(listQueryModel[i].orAnd.key=="And"){
   print("AndAndAndAndAndAndAndAndAndAndAndAnd");
    if(chosen.isEmpty){
      chosenList=[];
      break;
    }else{
      chosenList=chosen;
    }
  }else {
      if(chosen.isEmpty){
        chosen=chosenList;
      }else{
        chosenList=chosen;
      }
    }

  }
  print(chosenList);
  return chosen;
}

switchKey(QueryBuilderModel queryBuilderModel,value){
  List<UserModel> chosen=[];
  print("Esraa");
  print(queryBuilderModel.sortSearch);
  switch(queryBuilderModel.sortSearch){
    case 1:
      print("111");

      chosen=chooseOreatorInteger(queryBuilderModel,value);
      break;
    case 0:

      chosen= chooseOreatorString(queryBuilderModel,value);
      break;
  }
  return chosen;
}
chooseOreatorInteger(QueryBuilderModel queryBuilderModel,value){
  List<UserModel> chosen=[];
  switch(queryBuilderModel.operator.key) {
    case "=":
      print("ggggggg");
      chosen= ProcessInteger().chooseKeyIntegerEqual(queryBuilderModel.key.key, value, chosenList);
      break;
    case "<":
      chosen= ProcessInteger().chooseKeyIntegerMore(queryBuilderModel.key.key, value, chosenList);
        break;
    case ">":
      chosen=ProcessInteger(). chooseKeyIntegerLess(queryBuilderModel.key.key, value, chosenList);
      break;
    case "!=":
      chosen = ProcessInteger(). chooseKeyIntegerNotEqual(queryBuilderModel.key.key, value, chosenList);
      break;
  }
  return chosen;
}

chooseOreatorString(QueryBuilderModel queryBuilderModel,value){
  List<UserModel> chosen=[];
  switch(queryBuilderModel.operator.key) {
    case "StartWith":
      print("////////////////");
      chosen= ProcessString().chooseKeyStringStartWith(queryBuilderModel.key.key, value, chosenList);
      break;
    case "EndWith":
      chosen= ProcessString().  chooseKeyStringEndWith(queryBuilderModel.key.key, value, chosenList);
      break;
    case "contain":
      chosen= ProcessString().chooseKeyStringContain(queryBuilderModel.key.key, value, chosenList);
      break;
    case "exact":
      chosen=ProcessString().chooseKeyStringExact(queryBuilderModel.key.key, value, chosenList);
      break;

  }
  return chosen;
}



showLookups(indexQueryModel,sortLookUps){
  print("age");
  switch(sortLookUps){

    case 0:
      if(listQueryModel[indexQueryModel].showKey==false) {
        listQueryModel[indexQueryModel].showKey = true;
      }else{
        listQueryModel[indexQueryModel].showKey = false;
      }
      break;
    case 1:
      if(listQueryModel[indexQueryModel].showOperator==false) {

        listQueryModel[indexQueryModel].showOperator = true;
      }else{
        listQueryModel[indexQueryModel].showOperator = false;
      }
      break;
    case 2:
      if(listQueryModel[indexQueryModel].showAddORJoin==false) {
        listQueryModel[indexQueryModel].showAddORJoin = true;
      }else{
        listQueryModel[indexQueryModel].showAddORJoin = false;
      }
      break;
  }

  notifyListeners();
}





chooseValue(indexQueryModel,sortLookUps,LookupsModel valueLookUps,int newIndexLookUps){
  switch(sortLookUps){
    case 0:

      AppLookUps.keyList[listQueryModel[indexQueryModel].key.index].chosen=false;
      listQueryModel[indexQueryModel].key=valueLookUps;
      if(listQueryModel[indexQueryModel].key.key=="age"||listQueryModel[indexQueryModel].key.key=="gender"){

        listQueryModel[indexQueryModel].sortSearch=1;
        listQueryModel[indexQueryModel].operator=AppLookUps.operatorListInteger[0];

      }else{
        listQueryModel[indexQueryModel].sortSearch=0;
        listQueryModel[indexQueryModel].operator=AppLookUps.operatorListString[0];

      }
      AppLookUps.keyList[newIndexLookUps].chosen=true;
      break;
    case 1:
if(listQueryModel[indexQueryModel].sortSearch==0) {

  listQueryModel[indexQueryModel].operator = valueLookUps;

}else {

  listQueryModel[indexQueryModel].operator = valueLookUps;

}


      break;
    case 2:

      listQueryModel[indexQueryModel].orAnd = valueLookUps;


      break;
  }
notifyListeners();

}

addQuery(){

  if(sizeSearch<5){
    listQueryModel.add( QueryBuilderModel(orAnd: AppLookUps.operatorListORAND[0],sortSearch: 0,key: AppLookUps.keyList[0], operator: AppLookUps.operatorListString[0],
      sortOperator: "=",showOperator: false,showKey: false,showAddORJoin: false, value: '',));
    sizeSearch ++;
  }

  notifyListeners();
}

minsQuery(){
  if(sizeSearch>1){
    sizeSearch --;
  }
  notifyListeners();
}

  void listen() {
  notifyListeners();
  }






}