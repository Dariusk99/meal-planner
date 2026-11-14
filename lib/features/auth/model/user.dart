class User {
  const User({
    required this.username,
    required this.email,
    required this.password,
    this.id,
  });

  final int? id;
  final String username;
  final String email;
  final String password;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, Object?> map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}