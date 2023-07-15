import 'package:flutter/material.dart';
import 'package:food/components.dart';
import 'package:food/expenes.dart';
import 'package:food/expense_summary.dart';
import 'package:food/expenses_data.dart';
import 'package:provider/provider.dart';
// import 'expenses_.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  //text contollers
  final Namecontroller = TextEditingController();
  final Ammountcontroller = TextEditingController();
  final paymentcontroller = TextEditingController();
  @override
  //adding expense
  void newexpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Transaction'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "purchased",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
                ),
              ),
              // autofillHints: ,
              controller: Namecontroller,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Ammount",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
                ),
              ),
              controller: Ammountcontroller,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Payment Mode",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
                ),
              ),
              controller: paymentcontroller,
            ),
          ],
        ),
        actions: [
          MaterialButton(onPressed: cancel, child: Text('cancel')),
          MaterialButton(onPressed: save, child: Text('save')),
        ],
      ),
    );
  }

  void save() {
    expenseItem newexpense = expenseItem(
      name: Namecontroller.text,
      ammount: Ammountcontroller.text,
      dateTime: DateTime.now(),
      payment: paymentcontroller.text,
    );
    Provider.of<expenseData>(context, listen: false).addnewexpense(newexpense);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    Namecontroller.clear();
    Ammountcontroller.clear();
    paymentcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<expenseData>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Color.fromARGB(255, 142, 68, 173),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: newexpense,
                  child: Icon(
                    Icons.add,
                    color: Colors.blue,
                  )),
              body: ListView(
                children: [
                  expensesummary(startofweek: value.startofweekData()),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getallList().length,
                    itemBuilder: (context, index) => ExpenseTile(
                      name: value.getallList()[index].name,
                      amount: value.getallList()[index].ammount,
                      payment: value.getallList()[index].payment,
                      date: value.getallList()[index].dateTime,
                    ),
                  ),
                ],
              ),
            ));
  }
}
