class AdminModel {
  String? id;
  String? image;
  String? fullName;
  String? age;
  String? gender;
  String? category;
  String? position;
  String? aboutTrip;
  String? startTime;
  String? endTime;
//String? patients;
  String? experience;
  int? rating;
  List wishList;

  AdminModel({
    this.id,
    this.image,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.category,
    required this.position,
    required this.startTime,
    required this.endTime,
    this.aboutTrip,
    //  this.patients,
    this.experience,
    this.rating,
    required this.wishList,
  });

  factory AdminModel.fromJson(String id, Map<String, dynamic> json) {
    return AdminModel(
      id: id,
      image: json['image'],
      fullName: json['fullName'],
      age: json['age'],
      gender: json['gender'],
      category: json['category'],
      position: json['position'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      aboutTrip: json['aboutDoctor'],
      // patients: json['patients'],
      experience: json['experience'],
      rating: json['rating'],
      wishList: List<String>.from(json['wishlist']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'fullName': fullName,
      'age': age,
      'gender': gender,
      'category': category,
      'position': position,
      'startTime': startTime,
      'endTime': endTime,
      'aboutDoctor': aboutTrip,
      // 'patients': patients,
      'experience': experience,
      'rating': rating,
      'wishlist': wishList
    };
  }
}
