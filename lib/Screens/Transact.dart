import 'package:flutter/material.dart';
import '../Widgets.dart'; 

class Transact extends StatefulWidget {
  @override
  _TransactState createState() => _TransactState();
}

class _TransactState extends State<Transact> {
  List <String> notifs = new List();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transact'),
        // leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Card(
            child: LoginField(label: 'Request or Pay')
          ),
          Card(
            child: LoginField(label: 'Enter Amount of Request')
          ),
          Card(
            child: LoginField(label: "Enter Friend's email or Mobile Number")
          ),
          Card(
            child: LoginField(label: 'Say a Message to Them')
          ),
          FormButton(label: 'Request')       
        ]
      )
    );
  }
}