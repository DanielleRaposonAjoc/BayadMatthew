import 'package:flutter/material.dart';
import '../Widgets.dart';
class Menu extends StatelessWidget {
  List <String> sections = ['Grocery','Mall','Kids'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey[300],
    appBar:AppBar(
      backgroundColor: Colors.blue[600],
      title: Image.asset('assets/images/logo_home.png',fit: BoxFit.contain,height: 32),
      centerTitle: true,
      leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications), 
          onPressed: (){
            Navigator.pushNamed(context, '/Notifications');
          },
        )
      ],
    ),
    body: Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          // WalletsScroll(sections: sections),
          // Row(
          //   children: <Widget> [
          //     CashBalance(),
          //     BulsaBalance(),
          //   ]
          // ),
          Card(
            child: LoginField(label: 'Enter Amount of Transfer')
          ),
          Card(
            child: LoginField(label: "Bulsa or Wallet")
          ),
          FormButton(label: 'Convert'),   
          Expanded(child: Container()),
          _Menus()
        ]
      ),
    ),
  );
  }
}

class _Menus extends StatelessWidget {


  // const _Menus({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: _MenuButton(
                    text: 'Pay',
                    image:'assets/images/button_pay.png',
                    location: '/Transact',
                  ),
                ),
                Expanded(
                  child:_MenuButton(
                    text: 'Receive',
                    image:'assets/images/button_receive.png',
                    location: '/Receive',
                  ), 
                ),
                Expanded(
                  child: _MenuButton(
                    text: 'History',
                    image:'assets/images/button_history.png',
                    location: '/TransactionHistory',
                  ),
                ),
                Expanded(
                  child: _MenuButton(
                    text: 'Deposit',
                    image:'assets/images/button_addfunds.png'
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: _MenuButton(
                    text: 'Bulsa',
                    image:'assets/images/button_bulsa.png',
                    location: '/Bulsa',
                  ),
                ),
                Expanded(
                  child: _MenuButton(
                    text: 'Tipid',
                    image:'assets/images/button_tipid.png',
                    location: '/TipidPera',

                  ),
                ),
                Expanded(
                  child:_MenuButton(
                    text: 'Find',
                    image:'assets/images/button_anthony.png'
                  ),
                ),
                Expanded(
                  child: _MenuButton(
                    text: 'More',
                    image:'assets/images/button_more.png'
                  ),
                ),
              ],
            ),
          ]
        ),
      )
    );
  }
}

class WalletsScroll extends StatelessWidget {
  const WalletsScroll({
    Key key,
    @required this.sections,
  }) : super(key: key);

  final List<String> sections;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      child: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sections.length,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.all(5),
              child: FlatButton(
                onPressed: (){},
                color: Colors.orange,
                child: Text(sections[index])
              ),
            );
          }
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String text;
  final String image;  
  final Function function;
  final String location;

  const _MenuButton({
    @required this.text,
    @required this.image,
    this.function,
    this.location
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){ Navigator.pushNamed(context, location);}, 
      child: Column(
        children:<Widget>[
          Image.asset(image),
          Text(text)
        ]
      )
    );
  }
}
