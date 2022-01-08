import 'package:code95_task/model/query_build_model.dart';
import 'package:code95_task/model/user.dart';
import 'package:code95_task/services/service_handler.dart';

class DataQueryBuilder {
  getDataUser () async {
    try {
      List<UserModel> userList = [];
      var response = await ServicesHandler().getService();
      response.forEach((v) {
        UserModel repoModel = UserModel.fromJson(v);
        userList.add(repoModel);
      });
print(userList.length);
      return userList;
    }catch(ex){
      rethrow;
    }
  }


}