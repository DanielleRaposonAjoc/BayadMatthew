

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class WalletServices{
  getMainWallet(String muserid){
    return Firestore.instance
      .collection('mainWallets')
      .where('muserid',isEqualTo: muserid)
      .snapshots();
  }

  getTipidWallets(String mwid){
    return Firestore.instance
      .collection('tipidWallets')
      .where('mwid',isEqualTo: mwid)
      .snapshots();
  }

  addTipidWallet({String mwid, double twbal, String name}){
      Firestore.instance
      .collection('tipidWallets')
      .document()
      .setData({
        'mwalletid':mwid,
        'name':name,
        'twbal':twbal
      });
  }

  // addTipidWallets({String mwid, double twbal, String name}){
  //   if(addTipidWalletPossible(mwid,twbal)==true){
  //     Firestore.instance
  //     .collection('tipidWallets')
  //     .document()
  //     .setData({
  //       'mwalletid':mwid,
  //       'name':name,
  //       'twbal':twbal
  //     });
  //   }
  //   else{
  //     print('balance too small');
  //   }
  // }




//   Future<bool> addTipidWalletPossible (String mwid, double twbal) async{
//     var query= await Firestore.instance
//       .collection('mainWallets')
//       .document(mwid)
//       .get();

//      var mbal= await query.data['mbal'];
//      if(mbal-twbal >=0){
//        return true;
//      }
//      else{
//        return false;
//      }
//   }
}