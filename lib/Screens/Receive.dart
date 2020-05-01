import 'package:flutter/material.dart';
import '../Widgets.dart';

class Receive extends StatefulWidget {
  @override
  _ReceiveState createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  List <String> receives = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive'),
        // leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: receives.length,
        itemBuilder: (context, index){
          return Container(
            child: Text(receives[index])
          );
        })
    );
  }
}