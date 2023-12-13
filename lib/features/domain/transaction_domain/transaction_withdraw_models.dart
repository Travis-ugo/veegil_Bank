// To parse this JSON data, do
//
//     final transferAndTransactionsWithDrawModel = transferAndTransactionsWithDrawModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

TransactionsWithDrawModel transactionsWithDrawModelFromJson(String str) =>
    TransactionsWithDrawModel.fromJson(json.decode(str));

String transactionsWithDrawModelToJson(TransactionsWithDrawModel data) => json.encode(data.toJson());

class TransactionsWithDrawModel extends Equatable {
  final String status;
  final String message;
  final TransactionsWithDrawModelData data;

  const TransactionsWithDrawModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TransactionsWithDrawModel.fromJson(Map<String, dynamic> json) => TransactionsWithDrawModel(
        status: json["status"],
        message: json["message"],
        data: TransactionsWithDrawModelData.fromJson(json["data"]),
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

class  TransactionsWithDrawModelData extends Equatable {
  final int withdrawal;

  const TransactionsWithDrawModelData({
    required this.withdrawal,
  });

  factory TransactionsWithDrawModelData.fromJson(Map<String, dynamic> json) => TransactionsWithDrawModelData(
        withdrawal: json["withdrawal"],
      );

  Map<String, dynamic> toJson() => {
        "withdrawal": withdrawal,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [withdrawal];
}
