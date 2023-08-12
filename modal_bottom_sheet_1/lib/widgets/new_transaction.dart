import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isExpanse = true;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enterredTitle = _titleController.text;
    final enterredAmount = double.parse(_amountController.text);

    if (enterredTitle.isEmpty || enterredAmount <= 0) {
      return;
    }

    widget.addTx(
      enterredTitle,
      enterredAmount,
      isExpanse,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          gradient: LinearGradient(
              colors: [
                Color(0xff005b7f),
                Color(0xFF3366FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              stops: [
                0.4,
                1.0,
              ],
              tileMode: TileMode.clamp),
        ),
        padding: EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Colors.black45,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Title',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                controller: _titleController,
                onEditingComplete: () {
                  focusNode.requestFocus();
                },
                onSubmitted: (_) => _submitData,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              focusNode: focusNode,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Amount',
                fillColor: Colors.black45,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.black45,
              ),
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Type",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: isExpanse,
                          onChanged: (value) {
                            setState(() {
                              isExpanse = value!;
                            });
                          },
                        ),
                        const Text(
                          'Debit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Radio(
                          value: false,
                          groupValue: isExpanse,
                          onChanged: (value) {
                            setState(() {
                              isExpanse = value!;
                            });
                          },
                        ),
                        const Text(
                          'Credit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Add Transaction'),
              onPressed: () => _submitData(),
            )
          ],
        ),
      ),
    );
  }
}
