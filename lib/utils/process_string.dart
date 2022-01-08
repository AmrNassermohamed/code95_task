import 'package:code95_task/model/user.dart';
import 'package:flutter/cupertino.dart';

class ProcessString {
  RegExp regExp = RegExp(
    r"(?<![\w\d])abc(?![\w\d])",
    caseSensitive: false,
    multiLine: false,
  );
  chooseKeyStringStartWith(key,String  value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "firstName":
        print("//////////////////////");
        print(filterList[0].firstName);
        chosen= filterList.where((element) => element.firstName.toLowerCase().startsWith(value.toLowerCase())).toList();
        break;
      case "lastName":
        chosen =  filterList.where((element) => element.lastMame.toLowerCase().startsWith(value.toLowerCase())).toList();
        break;
      case "fullName":
        chosen =  filterList.where((element) => element.fullName.toLowerCase().startsWith(value.toLowerCase())).toList();
        break;
    }
    return chosen;
  }

  chooseKeyStringContain(key,String value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "firstName":
        chosen= filterList.where((element) => element.firstName.toLowerCase().contains(value.toLowerCase())).toList();
        break;
      case "lastName":
        chosen =  filterList.where((element) => element.lastMame.toLowerCase().contains(value.toLowerCase())).toList();
        break;
      case "fullName":
        chosen =  filterList.where((element) => element.fullName.toLowerCase().contains(value.toLowerCase())).toList();
        break;
    }
    return chosen;
  }

  chooseKeyStringEndWith(key,String value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "firstName":
        chosen= filterList.where((element) => element.firstName.toLowerCase().endsWith(value.toLowerCase())).toList();
        break;
      case "lastName":
        chosen =  filterList.where((element) => element.lastMame.toLowerCase().endsWith(value.toLowerCase())).toList();
        break;
      case "fullName":
        chosen =  filterList.where((element) => element.fullName.toLowerCase().endsWith(value.toLowerCase())).toList();
        break;
    }
    return chosen;
  }

  chooseKeyStringExact(key,String value,List<UserModel> filterList){
    List <UserModel>chosen=[];
    switch(key){
      case "firstName":
        chosen= filterList.where((element) =>reg(element.firstName, value)).toList();//(value.toLowerCase())).toList();
        break;
      case "lastName":
        chosen =  filterList.where((element) => reg(element.lastMame, value)).toList();
        break;
      case "fullName":
        chosen =  filterList.where((element) => reg(element.fullName, value)).toList();
        break;
    }
    return chosen;
  }

  bool reg(String pattern,value) {
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}