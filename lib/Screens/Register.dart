import 'package:flutter/material.dart';
import '../Widgets.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          // fit: StackFit.expand,
          children:<Widget>[
            Center(
                child: Container(
                width: 260,
                child:Column(
                  children: <Widget>[
                    Image.asset('assets/logo_matthew.png', fit: BoxFit.contain,),
                    Text(
                      'Register', 
                      style:TextStyle(
                        fontSize: 36,
                        color: Colors.blue
                      ) 
                    ),
                    SizedBox(height:20),
                    LoginField( label: 'First Name'),
                    LoginField( label: 'Last Name'),
                    LoginField( label: 'Password'),
                    LoginField( label: 'Mobile Number'),
                    LoginField( label: 'E-mail Address'),
                    LoginField( label: 'Nominate 4-digit Pin'),
                    FlatButton( 
                      color: Colors.blue,
                      child: Text('Login'),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                      ),
                      onPressed: (){},
                    ),
                    Row(
                      children:<Widget>[
                        Text("Already have an account?",style: TextStyle(color:Colors.green)),
                        SizedBox(width:10),
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
                      ]
                    )

                  ],
                )
              ),
            ),
          ] 

        ),
      ),
    );
  }
}