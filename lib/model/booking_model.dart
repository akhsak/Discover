import 'package:discover/model/admin_model.dart';

class AppointmentModel {
  String? id;
  String? uId;
  String? travelId;
  String? date;
  String? name;
  String? email;
  String? phoneNumber;

  AdminModel? travel;

  AppointmentModel(
      {this.id,
      this.uId,
      this.travelId,
      required this.date,
      required this.name,
      this.email,
      required this.phoneNumber,
      this.travel});

  factory AppointmentModel.fromJson(String id, Map<String, dynamic> json) {
    return AppointmentModel(
      id: id,
      uId: json['userId'],
      travelId: json['docId'],
      date: json['date'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      travel: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': uId,
      'travelId': travelId,
      'id': id,
      'date': date,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
