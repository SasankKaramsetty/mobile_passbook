import 'package:flutter/material.dart';
import 'package:food/expenes.dart';
// import 'package:food/hive_database.dart';
import 'data_time_helper.dart';

class expenseData extends ChangeNotifier {
  //List of all expenses
  List<expenseItem> overallExpensesList = [];
  //get expense list
  List<expenseItem> getallList() {
    return overallExpensesList;
  }

  // final db = HiveDatabase();
  // void prepareData() {
  //   if (db.readdata().isNotEmpty) {
  //     overallExpensesList = db.readdata();
  //   }
  // }

  //add new expense
  void addnewexpense(expenseItem newexpense) {
    overallExpensesList.add(newexpense);
    notifyListeners();
    // db.savedata(overallExpensesList);
  }

  //delete expense
  void deleteexpense(expenseItem expenseitem) {
    overallExpensesList.remove(expenseitem);
    notifyListeners();
    // db.savedata(overallExpensesList);
  }

  //get day which i remove
  String getDayName(DateTime dataTime) {
    switch (dataTime.weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "friday";
      case 6:
        return "saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  //get the date for the start of the week
  DateTime startofweekData() {
    DateTime? startOfWeek;
    //get todays date
    DateTime today = DateTime.now();
    //go back towards from today to sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sunday') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  //convert overall list of expenses into a daily expense summary
  Map<String, double> calcultedailyexpensesummary() {
    Map<String, double> dailysummary = {};
    for (var expense in overallExpensesList) {
      String date = convertDateTimeTostring(expense.dateTime);
      double ammount = double.parse(expense.ammount);
      if (dailysummary.containsKey(date)) {
        double currentammount = dailysummary[date]!;
        currentammount += ammount;
        dailysummary[date] = currentammount;
      } else {
        dailysummary.addAll({date: ammount});
      }
    }
    return dailysummary;
  }
}
