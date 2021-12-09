import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

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
            : ListView.builder(
                itemBuilder: (tx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                "\$${transactions[index].amount.toStringAsFixed(2)}"),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                      ),
                    ),
                  );
                  // return Card(
                  //     child: Row(
                  //   children: [
                  //     Container(
                  //       margin:
                  //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  //       padding: EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //         color: Theme.of(context).primaryColor,
                  //         width: 2,
                  //       )),
                  //       child: Text(
                  //         "\$${transactions[index].amount.toStringAsFixed(2)}",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //             color: Theme.of(context).primaryColor),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           transactions[index].title,
                  //           style: Theme.of(context).textTheme.headline6,
                  //         ),
                  //         Text(
                  //           DateFormat("yyyy-mm-dd")
                  //               .format(transactions[index].date),
                  //           style: TextStyle(color: Colors.grey),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ));
                },
                itemCount: transactions.length,
              ));
  }
}
