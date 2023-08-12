import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, contraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: contraints.maxHeight * 0.05,
                    ),
                    SizedBox(
                        height: contraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assests/images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionListItem(
                  transaction: transactions[index],
                  deleteTx: deleteTx,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
