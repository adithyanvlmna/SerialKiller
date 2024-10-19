class Logineduser {
  final String killerid;
  final int id;
  final String name;
  final String username;
  final String password;
  final String profileimage;
  final int userid;
  Logineduser(
      {required this.killerid,
      required this.id,
      required this.name,
      required this.username,
      required this.password,
      required this.profileimage,
      required this.userid});
  factory Logineduser.fromMap(Map<String, dynamic> data) {
    return Logineduser(
        killerid: data["killer_id"],
        id: int.parse(data["id"]),
        name: data["name"],
        username: data["username"],
        password: data["password"],
        profileimage: data["profile_image"],
        userid: int.parse(data["user_id"]));
  }
}
