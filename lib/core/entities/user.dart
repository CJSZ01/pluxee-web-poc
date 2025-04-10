import 'dart:convert';

final class User {
  final String name;
  final String password;

  User({required this.name, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'password': password};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ password.hashCode;

  @override
  String toString() => 'User(name: $name, password: $password)';
}
