import 'package:flutter/material.dart';
import 'package:money_tracking/controller/transaction_provider.dart';
import 'package:money_tracking/view/widgets/header_card.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<TransactionsProvider>(context);
    final balance = provider.getBalance();  
    final incomes = provider.getTotalIncomes();
    final expenses = provider.getTotalExpenses();

    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(
              'MONEY TRACKER',
              style: textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.teal.shade900),
            ),
            const SizedBox(height: 12),
            Text(
              'Balance:',
              style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5)),
            ),
            Text(
              'Q ${balance.toStringAsFixed(2)}',
              style: textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child:  Row(
                children: [
                  HeaderCard(
                    title: 'Incomes',
                    amount: incomes,
                    icon: const Icon(Icons.attach_money, color:Colors.teal),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  HeaderCard(
                    title: 'Expenses',
                    amount: expenses,
                    icon: const Icon(Icons.money_off, color: Colors.red),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

