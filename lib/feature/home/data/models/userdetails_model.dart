import 'package:garagewa/feature/home/domain/entities/userdetails.dart';

class UserDetailsModel extends UserDetails {
  UserDetailsModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.profile,
    required super.profileUrl,
    required super.phone,
    required super.email,
    required super.addresses,
    required super.carTypes,
    required super.isDeleted,
    required super.isActive,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      id: json['id'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      profile: json['profile'] ?? "",
      profileUrl: json['profileUrl'] ?? "",
      phone: json['phone'] ?? {},
      email: json['email'] ?? {},
      addresses: json['addresses'] ?? [],
      carTypes: json['carTypes'] ?? [],
      isDeleted: json['isDeleted'] ?? false,
      isActive: json['isActive'] ?? false,
    );
  }
}
