import 'package:flutter/material.dart';
import 'Screens/Menu.dart';

import 'Screens/Notifications.dart';
import 'Screens/Loading.dart';
import 'Screens/Transact.dart';
import 'Screens/Receive.dart';

import 'Screens/Bulsa.dart';
import 'Screens/TipidPera.dart';
import 'Screens/TransactionHistory.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/Wrapper',
  routes:{
    '/' : (context) => Loading(),
    '/Menu' : (context) => Menu(),
    '/Wrapper' : (context) => Menu(),
    '/Notifications' : (context) => Notifications(),
    '/TransactionHistory' : (context) => TransactionHistory(),
    '/Bulsa' : (context) => Bulsa(),
    '/TipidPera' : (context) => TipidPera(),
    '/Transact' : (context) => Transact(),
    '/Receive' : (context) => Receive()
  },

)
);

