class UserDetails {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? profile;
  final String? profileUrl;
  final Map<String, dynamic>? phone;
  final Map<String, dynamic>? email;
  final List<dynamic>? addresses;
  final List<dynamic>? carTypes;
  final bool? isDeleted;
  final bool? isActive;

  UserDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profile,
    required this.profileUrl,
    required this.phone,
    required this.email,
    required this.addresses,
    required this.carTypes,
    required this.isDeleted,
    required this.isActive,
  });
}
