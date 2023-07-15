import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String payment;
  final String amount;
  final DateTime date;

  ExpenseTile({
    required this.name,
    required this.payment,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(payment),
          Text(date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString()),
        ],
      ),
      trailing: Text('\$' + amount),
    );
  }
}
