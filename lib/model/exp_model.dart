// To parse this JSON data, do
//
//     final expense = expenseFromJson(jsonString);

import 'dart:convert';

List<Expense> expenseFromJson(String str) => List<Expense>.from(json.decode(str).map((x) => Expense.fromJson(x)));

String expenseToJson(List<Expense> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expense {
  String expType;
  String category;
  String amount;

  Expense({
    required this.expType,
    required this.category,
    required this.amount,
  });

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    expType: json["expType"],
    category: json["category"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "expType": expType,
    "category": category,
    "amount": amount,
  };
}
