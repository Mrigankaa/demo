import 'package:garagewa/feature/home/domain/entities/services.dart';

class ServiceModel extends Services {
  ServiceModel({
    required super.id,
    required super.packageCategoryName,
    required super.parentId,
    required super.packageIndex,
    required super.packagePicUrl,
    required super.isEnabled,
    required super.isDeleted,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      packageCategoryName: json['packageCategoryName'],
      parentId: json['parentId'],
      packageIndex: json['packageIndex'],
      packagePicUrl: json['packagePicUrl'],
      isEnabled: json['isEnabled'],
      isDeleted: json['isDeleted'],
    );
  }
}
