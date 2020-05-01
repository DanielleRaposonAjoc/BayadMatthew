import 'package:flutter/material.dart';
import '../Widgets.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
          // fit: StackFit.expand,
          children:<Widget>[
            Center(
                child: SizedBox(
                width: 250,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/logo_matthew.png', fit: BoxFit.contain,),
                    Text(
                      'Log In', 
                      style:TextStyle(
                        fontSize: 36,
                        color: Colors.blue
                      ) 
                    ),
                    SizedBox(height:20),
                    LoginField( label: 'Enter Email Or Mobile Number'),
                    SizedBox(height:20),
                    LoginField( label: 'Password'),
                    SizedBox(height:20),
                    FlatButton( 
                      color: Colors.blue,
                      child: Text('Login'),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                      ),
                      onPressed: (){},
                    ),
                    SizedBox(height:20),
                    Text("Don't have an account yet?",style: TextStyle(color:Colors.green)),
                    FlatButton( 
                      color: Colors.white,
                      child: Text('Register'),
                      textColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)
                      ),
                      onPressed: (){},
                    ),
                  ],
                )
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: FlatButton(
                onPressed: (){}, 
                child: Text(
                  'Need Help?',
                  style: TextStyle(color:Colors.blue, fontSize: 16)
                )
              )
            ),
          ] 

        ),
      ),
    );
  }
}

