class UserModel {
  String? uId;
  String? userName;
  String? email;
  String? phoneNumber;
  String? age;

  UserModel({
    required this.uId,
    required this.userName,
    required this.email,
    required this.age,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uId: json['userId'],
        userName: json['name'],
        age: json['age'],
        email: json['email'],
        phoneNumber: json['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': uId,
      'name': userName,
      'age': age,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
