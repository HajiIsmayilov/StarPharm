import 'dart:convert';

class User {
  String fullName;
  String username;
  String birthdate;
  String gender;
  String phone;
  String email;
  String location;
  String role;

  User({
    required this.fullName,
    required this.username,
    required this.birthdate,
    required this.gender,
    required this.role,
    required this.phone,
    required this.email,
    required this.location,
  });

  User copyWith({
    String? fullName,
    String? username,
    String? birthdate,
    String? gender,
    String? role,
    String? phone,
    String? email,
    String? location,
  }) =>
      User(
        fullName: fullName ?? this.fullName,
        username: username ?? this.username,
        birthdate: birthdate ?? this.birthdate,
        gender: gender ?? this.gender,
        role: role ?? this.role,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        location: location ?? this.location,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        username: json["username"],
        birthdate: json["birthdate"],
        gender: json["gender"],
        role: json["role"],
        phone: json["phone"],
        email: json["email"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "username": username,
        "birthdate": birthdate,
        "gender": gender,
        "role": role,
        "phone": phone,
        "email": email,
        "location": location
      };
}
