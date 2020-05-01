import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Services/WalletServices.dart';

class LoginField extends StatelessWidget {
  final String label;

  const LoginField({
    @required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
                  child: Text(
            label,
            style: TextStyle(
              fontSize: 16
            ) ,),
        ),
        TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              isDense: true,
            ),
        )
      ],
    );
  }
}

class FormButton extends StatelessWidget {
  final String label;
  final Function function;
  const FormButton({
    @required this.label,
    this.function
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton( 
      color: Colors.blue,
      child: Text(label),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      onPressed:(){ WalletServices().addTipidWallet(
              name: 'plants',
              twbal:170.00,
              mwid:'FzBbogTrZWUBWPf26vOl'
            );}
    );
  }
}

class BulsaBalance extends StatelessWidget {
  const BulsaBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(12),
        child: Column(
          children: <Widget> [
            Text('Bulsa Balance',
              style: TextStyle(
                fontSize: 16,
              )
            ),
            Text('230.00',
              style: TextStyle(
                fontSize: 25
              )
            )
          ]
        ),
      )
    );
  }
}


class CashBalance extends StatefulWidget {
  @override
  _CashBalanceState createState() => _CashBalanceState();
}

class _CashBalanceState extends State<CashBalance> {
  Stream streamMainWallets;
  DocumentSnapshot ds;
  @override
  void initState() { 
    super.initState();
    streamMainWallets =WalletServices().getMainWallet('5jzqheU49XKADeRCSfBH');
    

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream:  streamMainWallets ,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      ds=snapshot.data.documents[0];
      return Card(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(12),
          child: Column(
            children: <Widget> [
              Text('Money you have',
                style: TextStyle(
                  fontSize: 16,
                )
              ),
              Text('${ds['mbal'].toString()}',
                style: TextStyle(
                  fontSize: 25
                )
              )
            ]
          ),
        )
      );
    }
    );
  }
}



class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:<Widget>[
          // Container(height:50,color:Colors.blue),
          Text('nameee',style: TextStyle(fontSize: 20)),
          Text('PIIIIC')
        ]
      ),
      
    );
  }
}

class TipidPeraList extends StatefulWidget {
  @override
  _TipidPeraListState createState() => _TipidPeraListState();
}

class _TipidPeraListState extends State<TipidPeraList> {
  Stream streamTipidWallets;
  DocumentSnapshot ds;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // streamTipidWallets=WalletServices().getTipidWallets('FzBbogTrZWUBWPf26vOl');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
      .collection('tipidWallets')
      .where('mwid',isEqualTo: 'FzBbogTrZWUBWPf26vOl')
      .snapshots(),
      builder: (context,snapshot){
        if(snapshot.data==null){return Text('Loading');}
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){
            ds=snapshot.data.documents[index];
            return Card(
              child: Column(
                children: <Widget>[
                  Text('${ds['name']}'),
                  Text('${ds['twbal']}')
                ]
              ),
            );
          }
          
        );
        
      }
      );
  }
}

