import 'package:garagewa/core/cubits/enities/user.dart';

class UserModel extends User {
  UserModel({
    required super.expireIn,
    required super.userId,
    required super.userName,
    required super.userRole,
    required super.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      expireIn: json['EXPIRES_IN'],
      userId: json['USER_ID'],
      userName: json['USER_NAME'],
      userRole: json['USER_ROLE'],
      isVerified: json['IS_VERIFIED'],
    );
  }
}
