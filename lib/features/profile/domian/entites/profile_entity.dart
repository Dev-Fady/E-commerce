class ProfileEntity {
  final String name;
  final int id;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  ProfileEntity(
      {required this.name,
      required this.id,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});
}
