import 'package:garagewa/core/cubits/enities/user_token.dart';

class UserTokenModel extends UserToken {
  UserTokenModel({
    required super.userId,
    required super.userName,
    required super.token,
  });

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
        userId: json['userId'],
        userName: json['userName'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['userId'] = userId;
    data['token'] = token;
    return data;
  }
}
