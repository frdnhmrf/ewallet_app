class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? profilePicture;
  final int? balance;
  final String? token;
  final String? username;
  final int? verified;
  final String? cardNumber;
  final String? pin;
  final String? password;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.balance,
    this.token,
    this.username,
    this.verified,
    this.cardNumber,
    this.password,
    this.pin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        profilePicture: json['profile_picture'],
        balance: json['balance'],
        token: json['token'],
        username: json['username'],
        verified: json['verified'],
        cardNumber: json['card_number'],
        pin: json['pin'],
      );

  UserModel copyWith({
    String? name,
    String? email,
    int? balance,
    String? pin,
    String? password,
    String? username,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      balance: balance ?? this.balance,
      username: username ?? this.username,
      pin: pin ?? this.pin,
      password: password ?? this.password,
      verified: verified,
      profilePicture: profilePicture,
      token: token,
      cardNumber: cardNumber,
    );
  }
}
