import 'package:flutter/material.dart';
import 'package:money_tracking/view/components/transaction_list.dart';

import 'components/add_transaction_dialog.dart';
import 'home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            HomeHeader(),
            TransactionList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          //Mostrar un dialogo de alerta para agregar transaccion.
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
             return const AddTransactionDialog();
            },
          );
        },
        child: const Icon(Icons.add,
        color: Colors.white,
        ),
      ),
    );
  }
}
