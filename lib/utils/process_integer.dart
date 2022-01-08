import 'package:code95_task/model/user.dart';

class ProcessInteger {



  chooseKeyIntegerEqual(key,value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "age":

        chosen= filterList.where((element) => element.age==int.parse(value)).toList();
        break;
      case "gender":
        chosen =  filterList.where((element) => element.gender==int.parse(value)).toList();
        break;
    }
    return chosen;
  }
  chooseKeyIntegerNotEqual(key,value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "age":
        chosen= filterList.where((element) => element.age!=int.parse(value)).toList();
        break;
      case "gender":
        chosen=  filterList.where((element) => element.gender!=int.parse(value)).toList();
        break;
    }
    return chosen;
  }



  chooseKeyIntegerMore(key,value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "age":
        chosen=filterList.where((element) => element.age>int.parse(value)).toList();
        break;
      case "gender":
        chosen =filterList.where((element) => element.gender>int.parse(value)).toList();
        break;
    }
    return chosen;
  }


  chooseKeyIntegerLess(key,value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "age":
        chosen=filterList.where((element) => element.age<int.parse(value)).toList();
        break;
      case "gender":
        chosen=filterList.where((element) => element.gender<int.parse(value)).toList();
        break;
    }
    return chosen;
  }
}