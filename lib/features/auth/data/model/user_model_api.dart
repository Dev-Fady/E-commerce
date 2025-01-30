class UserModelApi {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String image;

  UserModelApi({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    };
  }
}
