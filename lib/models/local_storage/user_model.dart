import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2, adapterName: 'UserModelAdapter')
class UserModel with ChangeNotifier {
  @HiveField(0)
  final int? userId;
  @HiveField(1)
  final String? firstName;
  @HiveField(2)
  final String? middleName;
  @HiveField(3)
  final String? lastName;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? imageUrl;
  @HiveField(6)
  final String? userType;
  @HiveField(7)
  final bool? isVerified;
  @HiveField(8)
  final String? phone;

  UserModel({
    this.email,
    this.userId,
    this.userType,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.middleName,
    this.isVerified = false,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userId: json['user_id'],
      imageUrl: json['image_url'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      userType: json['user_type'],
      isVerified: json['is_verified'],
      phone: json['phone']);

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'image_url': imageUrl,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'middle_name': middleName,
        'user_type': userType,
        'is_verified': isVerified,
        'phone': phone
      };
}
