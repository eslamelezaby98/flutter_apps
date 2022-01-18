// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControllar = TextEditingController();

  final amountControllar = TextEditingController();
  DateTime selectedDate;

  void submitDate() {
    if (amountControllar.text.isEmpty) {
      return;
    }

    final entreAmount = double.parse(amountControllar.text);
    final entreTitle = titleControllar.text;

    if (entreAmount <= 0 || entreTitle.isEmpty || selectedDate == null) {
      return;
    }

    widget.addTx(entreTitle, entreAmount, selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, 
          bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          margin: EdgeInsets.all(3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleControllar,
                onSubmitted: (_) => submitDate(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountControllar,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitDate(),
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      selectedDate == null
                          ? 'No date chose'
                          : 'Picked Daate : ${DateFormat.yMd().format(selectedDate)}',
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: submitDate,
                child: Text(
                  'Add Transaction',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
