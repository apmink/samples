import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: transaction.isExpanse ? Colors.red[100] : Colors.green[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            '₹${transaction.amount.toStringAsFixed(2)}',
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? TextButton.icon(
                  // textColor: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transaction.id),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transaction.id),
                ),
        ),
      ),
    );
  }
}
