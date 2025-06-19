// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginDto {
  final String username;
  final String password;
  LoginDto({required this.username, required this.password});

  LoginDto copyWith({String? username, String? password}) {
    return LoginDto(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'username': username, 'password': password};
  }

  factory LoginDto.fromMap(Map<String, dynamic> map) {
    return LoginDto(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDto.fromJson(String source) =>
      LoginDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginDto(username: $username, password: $password)';

  @override
  bool operator ==(covariant LoginDto other) {
    if (identical(this, other)) return true;

    return other.username == username && other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
