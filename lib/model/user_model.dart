class UserModel {
  String? name;
   String? age;
  String? email;
  String? phoneNumber;

  UserModel({
    this.email,
    this.age,
    this.name,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age':age,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
