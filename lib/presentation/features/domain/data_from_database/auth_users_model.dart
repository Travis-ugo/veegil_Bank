import 'dart:convert';

import 'package:veegil_bank_app/presentation/features/domain/data_from_database/accounts_list_models.dart';

AuthUsersModel authUsersModelFromJson(String str) =>
    AuthUsersModel.fromJson(json.decode(str));

String authUsersModelToJson(AuthUsersModel data) => json.encode(
      data.toJson(),
    );

class AuthUsersModel {
  String status;
  String message;
  List<AccountModel> data;

  AuthUsersModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthUsersModel.fromJson(Map<String, dynamic> json) => AuthUsersModel(
        status: json["status"],
        message: json["message"],
        data: List<AccountModel>.from(
          json["data"].map(
            (x) => AccountModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
