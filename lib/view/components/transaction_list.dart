import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracking/controller/transaction_provider.dart';
import 'package:money_tracking/model/transaction.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionsProvider>(context).transactions;

    

    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color:Colors.white,
        ),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context,index){

            final transaction = transactions[index];
            final type = transaction.type == TransactionType.income
            ? 'Income'
            : 'Expense';

            final value = transaction.type == TransactionType.expense
            ? '-Q ${transaction.amount.abs().toStringAsFixed(2)}'
            : 'Q ${transaction.amount.toStringAsFixed(2)}';

            String formatDate = DateFormat('dd/MM/yyyy').format(transaction.date);

            final color = transaction.type == TransactionType.expense
            ? Colors.red
            : Colors.teal;

            return ListTile(

              title: Text(transaction.description),
              subtitle: Text('$type $formatDate'),
              trailing: Text(value, style: TextStyle(fontSize: 14, color: color),),
              
            );
          },

        ),
      ),
    );
  }
}

