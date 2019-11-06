




class UserAPI {
  final String id;
  final String username;
  final String password;
  final String nama;

  

  UserAPI({
    this.id,
    this.username,
    this.password,
    this.nama,

  });

  factory UserAPI.fromJson(Map<String, dynamic> json) {
    return UserAPI(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      nama: json['nama'],

    );
  }
}