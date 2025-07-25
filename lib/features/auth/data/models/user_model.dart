import 'package:auther/features/auth/domain/entities/user.dart';

class UserModel {
  final String firstname;
  final String lastname;
  final String email;
  final String id;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'id': id,
    };
  }

  User toEntity() {
    return User(
      firstname: firstname,
      lastname: lastname,
      email: email,
      id: id,
    );
  }
}