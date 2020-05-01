import 'package:flutter/material.dart'; 

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List <String> notifs = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        // leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},),
      ),
      body: ListView.builder(
        itemCount: notifs.length,
        itemBuilder: (context, index){
          return Container(
            child: Text(notifs[index])
          );
        })
    );
  }
}