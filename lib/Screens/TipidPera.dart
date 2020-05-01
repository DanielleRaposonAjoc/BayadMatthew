import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Services/WalletServices.dart';
import '../Widgets.dart';

class TipidPera extends StatefulWidget {
  @override
  _TipidPeraState createState() => _TipidPeraState();
}

class _TipidPeraState extends State<TipidPera> {
  List<String> wallets = new List();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TipidPera'),
          // leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
        ),
        drawer: MainDrawer(),
        body: Column(children: <Widget>[
          CashBalance(),
          Expanded(
            // child:Text('to be made')
            child: TipidPeraList()
          ),
          Card(child: LoginField(label: "Name")),
          Card(child: LoginField(label: 'Amount')),
          FormButton(
            label: 'Create', 

          )
        ])
    );
  }
}
