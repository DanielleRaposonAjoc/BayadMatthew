import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
    home: TipidPera(),

  )
);


class TipidPera extends StatelessWidget {
  const TipidPera({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TipidPera'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PendingList()
          ),
        ],
      ),
    );
  }
}

class PendingList extends StatefulWidget {
  @override
  _PendingListState createState() => _PendingListState();
}

class _PendingListState extends State<PendingList> {
  WalletServices wal;

  @override
  @override
  void initState() { 
    super.initState();
    wal=WalletServices(mwid:'FzBbogTrZWUBWPf26vOl');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: wal.getPendingRequests(wal.mwid),
        builder: (context, snapshot){
          if(snapshot.data ==null){return Text('load');}
          return ListView.builder(
            scrollDirection:Axis.vertical,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              DocumentSnapshot ds = snapshot.data.documents[index];
              return Card(
                child: Column(
                  children : <Widget>[
                    Text('${ds['from']}'),
                    createPendingButton(ds['pendingType'], wal, ds.documentID,ds['amount'], ds['from']),
                    // Text('${ds['pendingType']}'),
                    Text('${ds['amount']}'),
                  ]
                ),
              );
            }
          );


        },

      )
      
    );
  }
}

Widget createPendingButton (String pendingType, WalletServices ws, String pendingId, double bal, String from){
  if(pendingType=='send'){
    return FlatButton(
      child: Text('accept'),
      onPressed: (){ 
        ws.addPendingToMainWallet(mwid: ws.mwid, bal:bal )
        .then((val){
          ws.deletePending(pendingId:pendingId, mwid:ws.mwid)
          .then((val){
            ws.addTransactionHistory(to:ws.mwid,bal:bal,from:from);
          });
        });
      },color: 
      Colors.red,);
  }
  else if (pendingType =='request'){
    return FlatButton(
      child: Text('send'), 
      onPressed: (){
        ws.addPendingRequestToReceiver(to: from, bal: bal, pendingType:'send')
        .then((val){
          ws.deletePending(pendingId:pendingId,mwid:ws.mwid);
        });
      },
      color:Colors.blue
    );
  }
}

class TipidPeraAdd extends StatefulWidget {
  TipidPeraAdd({Key key}) : super(key: key);

  @override
  _TipidPeraAddState createState() => _TipidPeraAddState();
}

class _TipidPeraAddState extends State<TipidPeraAdd> {
  WalletServices walletServices;
  String _name;
  double _twbal;
  final _formkey= GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _twbalController;
  var mbalFlag;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    walletServices=WalletServices(mwid:'FzBbogTrZWUBWPf26vOl' );
    _nameController = TextEditingController();
    _twbalController =TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value){
              if(value.isEmpty){
                return 'Please Enter Some Text';
              }
              return null;

             
            },
            onSaved: (val){
              _name= val;
            },
          ),
          TextFormField(
            controller: _twbalController,
            decoration: InputDecoration(labelText: 'balance'),
            validator: (val){

              //TODO add validation here
                if(val.isEmpty){
                  return 'Please enter some text';
                }
                else{
                  return null;
                }
          },
          onSaved: (val){
            _twbal= double.parse(val);
          },
        ),
        RaisedButton(
          child: Text('Add'),
          onPressed: (){
            print("formkey state is : ${_formkey.currentState.validate()}");

            if(_formkey.currentState.validate()){

              _formkey.currentState.save();
              // walletServices.addTipidWallet(mwid: walletServices.mwid, name: _name, twbal: _twbal);
              // walletServices.subtractNewTipidWalletFromMainWallet(mwid: walletServices.mwid, twbal:_twbal);
              walletServices.createTipidWallet(mwid: walletServices.mwid, name: _name, twbal: _twbal);
              _nameController.clear();
              _twbalController.clear();

            }
          },
        )
      ],
      ),
    );
  }
}

class TransactionAdd extends StatefulWidget {
  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  WalletServices wal1;
  WalletServices wal2;
  WalletServices wal3;
  String _transactionType;
  double _amount;
  String _recipient;
  String _message;
  final _formKey = GlobalKey <FormState>();
  TextEditingController  _transactionTypeController;
  TextEditingController _amountController;
  TextEditingController _recipientController;
  TextEditingController _messageController;



  @override
  void initState() { 
    super.initState();
    _transactionTypeController =TextEditingController();
    _amountController = TextEditingController();
    _recipientController = TextEditingController();
    _messageController = TextEditingController();
      wal1=WalletServices(mwid: 'FzBbogTrZWUBWPf26vOl');
      wal2 = WalletServices(mwid: 'Bl0Tkton9BgdUYoCK93p');
      wal3 = WalletServices(mwid:'kSz21TmAHBVMJFgdro8d');
    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _transactionTypeController,
            decoration: InputDecoration(labelText: 'transaction type'),
            validator: (value){
              if(value.isEmpty){
                return 'Please Enter Some Text';
              }
              return null;
            },
            onSaved: (val){
              _transactionType= val;
            },
          ),
          TextFormField(
            controller: _recipientController,
            decoration: InputDecoration(labelText: 'recipient'),
            validator: (val){

              //TODO add validation here
                if(val.isEmpty){
                  return 'Please enter some text';
                }
                else{
                  return null;
                }
          },
          onSaved: (val){
            _recipient= val;
          },
        ),
        TextFormField(
          controller: _amountController,
          decoration: InputDecoration(labelText: 'amount'),
          validator: (val){

            //TODO add validation here
            if(val.isEmpty){
              return 'Please enter some text';
            }
            else{
              return null;
            }
          },
          onSaved: (val){
            _amount= double.parse(val);
          },
        ),
        TextFormField(
          controller: _messageController,
          decoration: InputDecoration(labelText: 'message'),
          validator: (val){

            //TODO add validation here
            if(val.isEmpty){
              return 'Please enter some text';
            }
            else{
              return null;
            }
          },
          onSaved: (val){
            _message= val;
          },
        ),
        RaisedButton(
          child: Text('Add'),
          onPressed: (){

            if(_formKey.currentState.validate()){

              _formKey.currentState.save();
              wal3.addPendingRequestToReceiver(pendingType:_transactionType, bal:_amount, to: wal2.mwid, message:_message);
              _amountController.clear();
              _recipientController.clear();
              _messageController.clear();

            }
          },
        )
      ],
      ),
    );
  }
}



class WalletServices{
  String mwid;
  final db = Firestore.instance;
  String id;
  var mainBalance;


  //constructor
  WalletServices({this.mwid}){

  }

  //get user info
  getUserInfo(String userId) {
    return db.collection('users').document(userId).get()
      .then((doc){
        return doc.data;
      });
  }
  


  //gets all tipid wallets
  getTipidWallets(){
    return db
      .collection('tipidWallets')
      .snapshots();
  } 

  //gets all tipid wallets based on mwid
  getTipidWalletsOfMainBalance(String mwid){
    return db
      .collection('tipidWallets')
      .where('mwid', isEqualTo: mwid)
      .snapshots();
  }


  //addtipidWallet
  addTipidWallet({String mwid, String name, double twbal}) async {
    return await db
      .collection('tipidWallets')
      .add({
        'mwid' : mwid,
        'name' : name,
        'twbal' : twbal
      });
    // print(ref);
    // return ref;
  }

  //addtipidWallet
  subtractNewTipidWalletFromMainWallet({String mwid,  double twbal}) async {
      return await db
      .collection('mainWallets')
      .document(mwid)
      .updateData({
        'mbal' : FieldValue.increment(-twbal)
      });
    // return ref;
  }

  createTipidWallet({String mwid, String name, double twbal }){
    addTipidWallet(mwid: mwid, twbal: twbal, name: name).then((doc){
      subtractNewTipidWalletFromMainWallet(mwid:mwid, twbal:twbal);
    });
  }

  //TODO make snackbar
  addTipidWalletWithSnackbar({String mwid, String name, double twbal}){
    var res = addTipidWallet(mwid: mwid, name: name, twbal: twbal);
    print(res);
  }

  getMainWalletBalance(String mwid) async {
     return await db.collection('mainWallets').document(mwid).get();
  }

  makeTransaction({String to, double amount})async{

      addNewTransactionToReceiver(mwid:to, bal:amount)

    .then((data){
      addTransactionHistory(to: to, bal:amount);
    });
  }

  addTransactionHistory({String to, double bal,String from}) async{
    return await 
    db
    .collection('transactions')
    .add({
      'to':to,
      'from': from,
      'amount':bal,
      'createdAt': FieldValue.serverTimestamp()
    });
  }

  //addtipidWallet
  subtractNewTransactionFromSender({String mwid,  double bal}) async {
      return await db
      .collection('mainWallets')
      .document(mwid)
      .updateData({
        'mbal' : FieldValue.increment(-bal)
      });
    // return ref;
  }

  //addtipidWallet
  addNewTransactionToReceiver({String mwid,  double bal, String status}) async {
      return await db
      .collection('mainWallets')
      .document(mwid)
      .updateData({
        'mbal' : FieldValue.increment(bal)
      });
    // return ref;
  }

  addPendingRequestToReceiver({String to, double bal, String pendingType, String message}) async{
    return await 
    db
    .collection('mainWallets')
    .document(to)
    .collection('pending')
    .document()
    .setData({
      'from': this.mwid,
      'amount':bal,
      'sentAt': FieldValue.serverTimestamp(),
      'message' : message,
      'pendingType':pendingType
    });
  }

  getPendingRequests(mwid){
    return
    db
    .collection('mainWallets')
    .document(mwid)
    .collection('pending')
    .snapshots();
  }

  addPendingToMainWallet({String mwid, double bal}) async{
    return await
    db
    .collection('mainWallets')
    .document(mwid)
    .updateData({
      'mbal':FieldValue.increment(bal)
    });
  }

  deletePending({String pendingId, String mwid}) async{
    return await
    db
    .collection('mainWallets')
    .document(mwid)
    .collection('pending')
    .document(pendingId)
    .delete();
    // .add({
    //   'check':'hey'
    // });
  }

  








}