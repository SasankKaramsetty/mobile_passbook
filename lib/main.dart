import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/expenes.dart';
import 'package:food/expenses_data.dart';
import 'package:food/hometra.dart';
import 'package:food/navigationbar.dart';
import 'package:food/signup.dart';
import 'package:provider/provider.dart';
import 'LoginScreen.dart';
import 'home.dart';
import 'navigationbar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => expenseData(),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Home(),
            ));
  }
}
