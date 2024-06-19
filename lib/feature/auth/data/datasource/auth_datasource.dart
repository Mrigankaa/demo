import 'package:garagewa/core/exception/network_exception.dart';
import 'package:garagewa/core/services/dio.dart';
import 'package:garagewa/feature/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final HTTP http;
  AuthRemoteDataSourceImplementation(this.http);
  @override
  Future<UserModel> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
        url: '/ga-auth/signIn',
        data: {"username": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        final setCookie = response.headers["set-cookie"]![0];
        sharedPreferences.setString("userName", response.data['USER_NAME']);
        sharedPreferences.setString("userId", response.data['USER_ID']);
        sharedPreferences.setString("cookie", setCookie);
      }
      if (response.data == null) {}
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final response =
          await http.get(url: "/ga-auth/authentication/checkSession");
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
