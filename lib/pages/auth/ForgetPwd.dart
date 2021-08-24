import 'package:flutter/material.dart';
import 'package:web/pages/auth/SignUp.dart';

class ForgetPwd extends StatelessWidget {
  static const String routeName = "/forgetpwd";

  final data;
  ForgetPwd({this.data});
@override
 Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Forget Password'),
          ),
        body:
          new Container(
            child:
              new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(50.0),
                    child:
                      SizedBox(
                        width: 900,
                        child:
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                
                                children: <Widget>[
                                  new Image.network(
                                    'https://i.ibb.co/N2cGJHD/Sans-titre.webp',
                                    fit:BoxFit.contain,
                                    ),
                                    
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 25.0),
                                  ),
                                  new Text(
                                  "Forget Password",
                                    style: new TextStyle(fontSize:32.0,
                                    color: const Color(0xFF6f4949),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                                  ),
                    
                    
                                      new Padding(
                                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                      ),
                                        new Text(
                                                  "Enter your email below and we'll send you a link to rest your password !",
                                                    style: new TextStyle(fontSize:15.0,
                                                    color: const Color(0xFF6f4949),
                                                    fontWeight: FontWeight.w200,
                                                    fontFamily: "Roboto"),
                                            ),
                                            
                                  
                    
                                    
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                  ),

                                  new TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                    ),
                                    style: new TextStyle(fontSize:12.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Merriweather"),
                                  ),
                                  new Padding(
                                        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                                        ),
                                   new RaisedButton(key:null, onPressed:()=>buttonPressed(context),
                                          color: const Color(0xFFe0e0e0),
                                          child:
                                            new Text(
                                            "Submit",
                                              style: new TextStyle(fontSize:12.0,
                                              color: const Color(0xFF000000),
                                              fontWeight: FontWeight.w200,
                                              fontFamily: "Roboto"),
                                            )
                                      ),

                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                  ),
                                   new TextButton(
                                          onPressed: () {
                                            createAccountPressed(context);
                                          },
                                          child: Text(
                                            'Don\'t Have Account? Signup here', //title
                                            textAlign: TextAlign.end, //aligment
                                              style: new TextStyle(fontSize:12.0,
                                                color: const Color(0xFF6071d0),
                                                fontFamily: "Roboto"),
                                              ),
                                          ),
                                ]
                    
                              ),
                      ),
            ),
    
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 1.0),
            alignment: Alignment.center,
          ),
    
      );
    }
    void buttonPressed(context){
       Navigator.pushNamed(context, SignUp.routeName,
                    arguments: "This is some data");
                   
    }
    void createAccountPressed(context){
       Navigator.pushNamed(context, SignUp.routeName,
                    arguments: "This is some data");
    }
    void forgetPressed(context){
    }
    
    void checkChanged(bool? value){}
    
}

