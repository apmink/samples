import 'package:flutter/material.dart';
import 'package:template_modal_bottom_sheet_1/models/transaction.dart';
import 'package:template_modal_bottom_sheet_1/constants/strings.dart';
import 'package:template_modal_bottom_sheet_1/widgets/new_transaction.dart';
import 'package:template_modal_bottom_sheet_1/widgets/transaction_list.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Earphone',
      amount: 1499,
      isExpanse: true,
    ),
    Transaction(
      id: 't2',
      title: 'Payment Received',
      amount: 2000,
      isExpanse: false,
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount, bool isExpanse) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      isExpanse: isExpanse,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.title)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff005b7f),
              Color(0xFF3366FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            stops: [0.4, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: TransactionList(_userTransactions, _deleteTransaction),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () {
          openModalSheet(context);
        },
      ),
    );
  }

  Future<void> openModalSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }
}
