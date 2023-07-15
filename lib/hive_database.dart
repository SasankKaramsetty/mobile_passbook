// import 'package:hive/hive.dart';

// import 'package:food/expenes.dart';

// class HiveDatabase {
//   //reference our box
//   final _mybox = Hive.box("expense_database");

//   //write data
//   void savedata(List<expenseItem> allexpenses) {
//     /*hive can only store strings and datetime and not custom objects like expenseitem */
//     List<List<dynamic>> allexpensesFormatted = [];
//     for (var expense in allexpenses) {
//       // var name;
//       List<dynamic> expenseFormated = [
//         expense.name,
//         expense.ammount,
//         expense.dateTime,
//         expense.payment,
//       ];
//       allexpensesFormatted.add(expenseFormated);
//     }
//     //lets store in local database
//     _mybox.put("All_Expenses", allexpensesFormatted);
//   }

//   //read daata
//   List<expenseItem> readdata() {
//     List savedExpenses = _mybox.get("All_Expenses") ?? [];
//     List<expenseItem> allexpenses = [];
//     for (int i = 0; i < savedExpenses.length; i++) {
//       String name = savedExpenses[i][0];
//       String ammount = savedExpenses[i][1];
//       DateTime dateTime = savedExpenses[i][2];
//       String payment = savedExpenses[i][3];

//       expenseItem expense = expenseItem(
//           name: name, ammount: ammount, dateTime: dateTime, payment: payment);
//       allexpenses.add(expense);
//     }
//     return allexpenses;
//   }
// }
