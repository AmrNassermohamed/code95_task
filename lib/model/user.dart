class UserModel {
  String firstName;
  String lastMame;
  String fullName;
  int gender;
  int age;
  int userId;
  UserModel({required this.age,required this.fullName,required this.firstName,required this.gender,required this.lastMame,required this.userId});
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(firstName: json["first_name"],lastMame: json["last_name"],fullName: "${json["first_name"] } ${json["last_name"]}",gender: json["gender"]=="M"?0:1,userId: json["id"], age: json["age"]);
  }
}


