class User {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //

  final String? id, userName, email, password, createAt, updateAt;

  final bool isAdmin;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  User({
    this.id = "",
    this.userName = "",
    this.email = "",
    this.password = "",
    this.createAt = "",
    this.updateAt = "",
    this.isAdmin = false,
  });

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'password': password,
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON - - - - - - - - - - - - - - - - - -  //
  static User fromJson(Map json) {
    return User(
      id: json['id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      isAdmin: json['isAdmin'] as bool,
    );
  }
}
