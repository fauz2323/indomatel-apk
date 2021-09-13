class DataUser {
  DataUser({
    required this.username,
    required this.email,
    required this.reff,
    required this.nohp,
  });

  String username;
  String email;
  String reff;
  String nohp;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        username: json["username"],
        email: json["email"],
        reff: json["reff"],
        nohp: json["nohp"],
      );
}
