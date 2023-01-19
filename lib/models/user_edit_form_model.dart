class UserEditFormModel {
  final String? username;
  final String? email;
  final String? name;
  final String? password;

  UserEditFormModel({
    this.username,
    this.email,
    this.name,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'name': name,
      'password': password,
    };
  }
}
