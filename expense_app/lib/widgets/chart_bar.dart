import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercent;

  ChartBar(this.label, this.spendingAmount, this.spendingPercent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Column(children: [
        Container(
            height: constraints.maxHeight *
                0.15, // keeps the bars and date text aligned when this label adjusts
            child: FittedBox(
                child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      border: Border.all(color: Colors.grey, width: 1)),
                ),
                FractionallySizedBox(
                    heightFactor: spendingPercent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ))
              ],
            )),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(child: Text(label)))
      ]),
    );
  }
}
