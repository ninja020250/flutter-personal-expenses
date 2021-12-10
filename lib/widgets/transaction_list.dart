import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraint) {
              return Column(
                children: [
                  Text("no transaction added yet!",
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraint.maxHeight - 20,
                    child: Image.asset(
                      "assets/images/pattern.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
          : ListView(
              children: transactions
                  .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: deleteTransaction))
                  .toList()),

// ListView.builder(
//                 itemBuilder: (tx, index) {
//                   return TransactionItem(
//                       key: ValueKey(transactions[index].id),
//                       transaction: transactions[index],
//                       deleteTransaction: deleteTransaction);
//                 },
//                 itemCount: transactions.length,
//               )
    );
  }
}
