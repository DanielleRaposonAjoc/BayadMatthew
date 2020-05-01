import 'package:flutter/material.dart';
import '../Widgets.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List<String> transactions = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
          // leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
        ),
        drawer: MainDrawer(),
        body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index){
          return Container(
            child: Text(transactions[index])
          );
        }));
  }
}
