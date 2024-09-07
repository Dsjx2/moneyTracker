class Transaction {
  
  final TransactionType type;
  final double amount;
  final String description;
  final DateTime  date;
  
  Transaction({
    required this.type,
    required this.amount,
    required this.description,
    required this.date,
  });

}


enum TransactionType {income, expense}