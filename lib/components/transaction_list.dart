import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final void Function(String) onRemove;

  TransactionList(this._transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child:
          _transactions.isEmpty
              ? Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(40)),
                  Text(
                    'Nenhuma Transação Registrada!',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 0),
                  Container(
                    height: 150,
                    child: Image.asset(
                      'assets/img/empty_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              : ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = _transactions[index]; // Define tr here

                  return Card(
                    color: Colors.grey.shade800,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.lightGreenAccent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'R\$ ${tr.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  tr.title,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM y').format(tr.date),
                                  style: TextStyle(color: Colors.white30),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => onRemove(tr.id),
                            icon: Icon(Icons.delete),
                            color: Colors.lightGreenAccent.shade200,
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
