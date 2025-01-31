class LoginUsingApiEntity extends Data {
  final String message;
  LoginUsingApiEntity(
      {required this.message,
      required super.id,
      required super.name,
      required super.email,
      required super.phone,
      required super.image,
      required super.points,
      required super.credit,
      required super.token});
}

class Data {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  Data(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});
}
