// To parse this JSON data, do
//
//     final accountsListModel = accountsListModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

AccountsListModel accountsListModelFromJson(String str) =>
    AccountsListModel.fromJson(json.decode(str));

String accountsListModelToJson(AccountsListModel data) =>
    json.encode(data.toJson());

class AccountsListModel extends Equatable {
  final String status;
  final String message;
  final List<AccountModel> data;

  const AccountsListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AccountsListModel.fromJson(Map<String, dynamic> json) =>
      AccountsListModel(
        status: json["status"],
        message: json["message"],
        data: List<AccountModel>.from(
            json["data"].map((x) => AccountModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [message, status, data];
}

class AccountModel extends Equatable {
  final String phoneNumber;
  final double? balance;
  final DateTime created;

  const AccountModel({
    required this.phoneNumber,
    required this.balance,
    required this.created,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        phoneNumber: json["phoneNumber"],
        balance: json["balance"]?.toDouble(),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "balance": balance,
        "created": created.toIso8601String(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber, balance, created];
}
