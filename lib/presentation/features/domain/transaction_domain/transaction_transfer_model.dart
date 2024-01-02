// To parse this JSON data, do
//
//     final transactionsTransferModel = transactionsTransferModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

TransactionsTransferModel transactionsTransferModelFromJson(String str) =>
    TransactionsTransferModel.fromJson(json.decode(str));

String transactionsTransferModelToJson(TransactionsTransferModel data) =>
    json.encode(data.toJson());

class TransactionsTransferModel extends Equatable {
  final String status;
  final String message;
  final TransactionsTransferModelData data;

  const TransactionsTransferModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TransactionsTransferModel.fromJson(Map<String, dynamic> json) =>
      TransactionsTransferModel(
        status: json["status"],
        message: json["message"],
        data: TransactionsTransferModelData.fromJson(json["data"]),
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

class TransactionsTransferModelData extends Equatable {
  final int sent;

  const TransactionsTransferModelData({
    required this.sent,
  });

  factory TransactionsTransferModelData.fromJson(Map<String, dynamic> json) => TransactionsTransferModelData(
        sent: json["sent"],
      );

  Map<String, dynamic> toJson() => {
        "sent": sent,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [sent];
}
