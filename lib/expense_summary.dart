import 'package:flutter/material.dart';
import 'package:food/expenses_data.dart';
import 'package:food/individual_bar.dart';
import 'package:provider/provider.dart';
import 'expenses_data.dart';
import 'package:flutter/material.dart';
import 'package:food/expenes.dart';
import 'data_time_helper.dart';

class expensesummary extends StatelessWidget {
  final DateTime startofweek;
  const expensesummary({
    required this.startofweek,
  });
  double calculatemax(
    expenseData val,
    String sunday,
    String monday,
    String tuesaday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double? max = 100;
    List<double> values = [
      val.calcultedailyexpensesummary()[sunday] ?? 0,
      val.calcultedailyexpensesummary()[monday] ?? 0,
      val.calcultedailyexpensesummary()[tuesaday] ?? 0,
      val.calcultedailyexpensesummary()[wednesday] ?? 0,
      val.calcultedailyexpensesummary()[thursday] ?? 0,
      val.calcultedailyexpensesummary()[friday] ?? 0,
      val.calcultedailyexpensesummary()[saturday] ?? 0,
    ];
    values.sort();
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  String weektotal(
    expenseData val,
    String sunday,
    String monday,
    String tuesaday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double? max = 100;
    List<double> values = [
      val.calcultedailyexpensesummary()[sunday] ?? 0,
      val.calcultedailyexpensesummary()[monday] ?? 0,
      val.calcultedailyexpensesummary()[tuesaday] ?? 0,
      val.calcultedailyexpensesummary()[wednesday] ?? 0,
      val.calcultedailyexpensesummary()[thursday] ?? 0,
      val.calcultedailyexpensesummary()[friday] ?? 0,
      val.calcultedailyexpensesummary()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  Widget build(BuildContext context) {
    String sunday =
        convertDateTimeTostring(startofweek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeTostring(startofweek.add(const Duration(days: 1)));
    String tueday =
        convertDateTimeTostring(startofweek.add(const Duration(days: 2)));
    String wedday =
        convertDateTimeTostring(startofweek.add(const Duration(days: 3)));
    String thuday =
        convertDateTimeTostring(startofweek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeTostring(startofweek.add(const Duration(days: 5)));
    String satday =
        convertDateTimeTostring(startofweek.add(const Duration(days: 6)));
    return Consumer<expenseData>(
        builder: (context, value, child) => Column(children: [
              SizedBox(
                height: 200,
                child: MyBarGraph(
                  maxY: calculatemax(value, sunday, monday, tueday, wedday,
                      thuday, friday, satday),
                  sunammount: value.calcultedailyexpensesummary()[sunday] ?? 0,
                  monammount: value.calcultedailyexpensesummary()[monday] ?? 0,
                  tueammount: value.calcultedailyexpensesummary()[tueday] ?? 0,
                  wedammount: value.calcultedailyexpensesummary()[wedday] ?? 0,
                  thuammount: value.calcultedailyexpensesummary()[thuday] ?? 0,
                  friammount: value.calcultedailyexpensesummary()[friday] ?? 0,
                  satammount: value.calcultedailyexpensesummary()[satday] ?? 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(children: [
                  const Text('week total:'),
                  Text('\$'+weektotal(value, sunday, monday, tueday, wedday, thuday, friday, satday)),
                ]),
              )
            ]));
  }
}
