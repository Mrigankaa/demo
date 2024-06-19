import 'package:garagewa/core/services/dio.dart';
import 'package:garagewa/feature/home/data/models/services_model.dart';
import 'package:garagewa/feature/home/data/models/userdetails_model.dart';

abstract class UserDetailsRemoteDataSource {
  Future<UserDetailsModel?> getUserDetails({
    required String userId,
  });

  Future<List<ServiceModel?>> getServices();
}

class UserDetailsRemoteDataSourceImplementataion
    extends UserDetailsRemoteDataSource {
  final HTTP http;
  UserDetailsRemoteDataSourceImplementataion(this.http);
  @override
  Future<UserDetailsModel?> getUserDetails({
    required String userId,
  }) async {
    try {
      final response = await http.get(
        url: '/ga-customer/customers/$userId',
      );
      return UserDetailsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ServiceModel?>> getServices() async {
    List<ServiceModel?> service = [];
    try {
      final response = await http.get(
        url: '/ga-attribute/servicePackageCategories?isEnabled=true',
      );
      if (response.statusCode == 200) {
        response.data.forEach((e) {
          service.add(ServiceModel.fromJson(e));
        });
      }
      return service;
    } catch (e) {
      rethrow;
    }
  }
}
