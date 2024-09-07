import 'package:flutter/material.dart';
import 'package:money_tracking/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      type: TransactionType.income,
      amount: 1000.00,
      description: 'Salary',
      date: DateTime(2024, 9, 7),
    ),
    Transaction(
      type: TransactionType.expense,
      amount: -500.00,
      description: 'Rent',
      date: DateTime(2024, 9, 8),
    ),
    
  ];

  List<Transaction> get transactions => _transactions;

  double getTotalIncomes() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getTotalExpenses(){
        return _transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getBalance(){
        return getTotalIncomes()+getTotalExpenses();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
