import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) => Column(
                    children: [
                      Text("No transactions added yet.",
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ))
          : ListView.builder(
              itemBuilder: (ctx, index) => Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}'))),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                      onPressed: () => deleteTx(transactions[index].id),
                      icon: Icon(Icons.delete,
                          color: Theme.of(context).errorColor)),
                ),
              ),
              itemCount: transactions.length,
            ),
    );
  }
}
