// To parse this JSON data, do
//
//     final AuthenticationSignUpModel = AuthenticationSignUpModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

AuthenticationSignUpModel authenticationSignUpModelFromJson(String str) =>
    AuthenticationSignUpModel.fromJson(json.decode(str));

String authenticationSignUpModelToJson(AuthenticationSignUpModel data) =>
    json.encode(data.toJson());

class AuthenticationSignUpModel extends Equatable {
  final String status;
  final String message;
  final AuthSignInData data;

  const AuthenticationSignUpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticationSignUpModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationSignUpModel(
        status: json["status"],
        message: json["message"],
        data: AuthSignInData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, data];
}

class AuthSignInData extends Equatable {
  final String phoneNumber;
  final DateTime created;

  const AuthSignInData({
    required this.phoneNumber,
    required this.created,
  });

  factory AuthSignInData.fromJson(Map<String, dynamic> json) => AuthSignInData(
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "created": created.toIso8601String(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber, created];
}

AuthenticationLogInModel authenticationLogInModelFromJson(String str) =>
    AuthenticationLogInModel.fromJson(json.decode(str));

String authenticationLogInModelToJson(AuthenticationLogInModel data) =>
    json.encode(data.toJson());

class AuthenticationLogInModel extends Equatable {
  final String status;
  final String message;
  final AuthLogInData data;

  const AuthenticationLogInModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticationLogInModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationLogInModel(
        status: json["status"],
        message: json["message"],
        data: AuthLogInData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, data];
}

class AuthLogInData extends Equatable {
  final String token;

  const AuthLogInData({
    required this.token,
  });

  factory AuthLogInData.fromJson(Map<String, dynamic> json) => AuthLogInData(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
