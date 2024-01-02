import 'dart:convert';

import 'package:equatable/equatable.dart';

TransactionsModel transactionsModelFromJson(String str) =>
    TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) =>
    json.encode(data.toJson());

class TransactionsModel extends Equatable {
  final String status;
  final List<TransactionsModelData> data;

  const TransactionsModel({
    required this.status,
    required this.data,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      TransactionsModel(
        status: json["status"],
        data: List<TransactionsModelData>.from(
            json["data"].map((x) => TransactionsModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [status, data];
}

class TransactionsModelData extends Equatable {
  final TransactionType type;
  final double? amount;
  final String phoneNumber;
  final DateTime created;
  final double? balance;

  const TransactionsModelData({
    required this.type,
    required this.amount,
    required this.phoneNumber,
    required this.created,
    this.balance,
  });

  factory TransactionsModelData.fromJson(Map<String, dynamic> json) =>
      TransactionsModelData(
        type: typeValues.map[json["type"]]!,
        amount: json["amount"]?.toDouble(),
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
        balance: json["balance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "amount": amount,
        "phoneNumber": phoneNumber,
        "created": created.toIso8601String(),
        "balance": balance,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [type, amount, phoneNumber, created, balance];
}

enum TransactionType {
  credit,
  debit,
}

final typeValues = EnumValues({
  "credit": TransactionType.credit,
  "debit": TransactionType.debit,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
