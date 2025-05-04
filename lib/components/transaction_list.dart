import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final void Function(String) onRemove;

  TransactionList(this._transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(
          builder: (ctx, constraints){
            return Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Nenhuma Transação Registrada!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/img/empty_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
          },
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
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
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
                    MediaQuery.of(context).size.width > 480 
                    ? TextButton.icon(
                      onPressed: () => onRemove(tr.id),
                      icon: Icon(Icons.delete),
                      label: Text('Excluir'),
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary 
                      )
                      )
                    : IconButton(
                      onPressed: () => onRemove(tr.id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.primary,
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}
