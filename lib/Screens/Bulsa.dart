import 'package:flutter/material.dart';
import '../Widgets.dart'; 

class Bulsa extends StatefulWidget {
  @override
  _BulsaState createState() => _BulsaState();
}

class _BulsaState extends State<Bulsa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulsa'),
        // leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          BulsaBalance(),
          Card(
            child: LoginField(label: 'Enter Amount of Transfer')
          ),
          Card(
            child: LoginField(label: "Enter Friend's Bluetooth Address")
          ),
          Card(
            child: LoginField(label: 'Pin')
          ),
          FormButton(label: 'Send')       
        ]
      )
    );
  }
}