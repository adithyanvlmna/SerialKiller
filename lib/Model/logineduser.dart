class Logineduser {
  final String id;
  final String name;
  final String scondname;
  final String email;
  final String profileimage;
  final String flat;
  final String mobile;
  Logineduser({
    required this.id,
    required this.name,
    required this.scondname,
    required this.email,
    required this.profileimage,
    required this.flat,
    required this.mobile,
  });
 factory Logineduser.fromMap(Map<String, dynamic> data) {
  return Logineduser(
    id: data["killer_id"].toString(),
    name: data["firstname"].toString(),
    scondname: data["secondname"].toString(),
    email: data["email"].toString(),
    profileimage: data["profile_image"].toString(),
    flat: data["flat"].toString(),
    mobile: data["mobile"].toString(),
  );
}

}
