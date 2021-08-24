import 'package:flutter/material.dart';
import 'package:web/pages/auth/SignUp.dart';
import 'package:web/pages/Dashboard/HomePage.dart';
import 'package:web/pages/auth/SignUpSuccess.dart';
import 'package:web/pages/auth/ForgetPwd.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {  
  final data;
  static const String routeName = "/SignIn";
  SignIn({this.data});
  _SignInState createState() => _SignInState();  
}  

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  FirebaseOptions get firebaseOptions => const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
      );
  bool checkedValue=false;
  
   void initState() {
    super.initState();
  }

@override
 Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Login'),
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
                                  "Welcome Back!",
                                    style: new TextStyle(fontSize:32.0,
                                    color: const Color(0xFF6f4949),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                                  ),
                    
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      
                                      new Image(
                                        image: AssetImage('icons/cam.png'),
                                        fit:BoxFit.fill,
                                        width: 32.0,
                                        height: 32.0,
                                        ),
                    
                                      new Padding(
                                        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                      ),
                                        new TextButton(
                                          onPressed: () {
                                            createAccountPressed(context);
                                          },
                                                  child: Text(
                                                  "Mobile User ? Scan QR code here",
                                                    style: new TextStyle(fontSize:12.0,
                                                    color: const Color(0xFF6071d0),
                                                    fontWeight: FontWeight.w200,
                                                    fontFamily: "Roboto"),
                                            )
                                        )
                                    ]
                    
                                  ),
                                  
                    
                                    
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                  ),

                                  new TextField(
                                    controller:emailController,
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
                                    padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 25.0),
                                  ),
                                  new TextField(
                                    controller:passwordController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                    obscureText: !checkedValue,
                                    style: new TextStyle(fontSize:12.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                                  ),
                    
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Checkbox(key:null, value:checkedValue,onChanged: (bool? value) {    
                                                                                       if (value != null) {
                                                                                            setState((){checkedValue = value;});
                                                                                          }
                                                                                    }),
                                      new Text(
                                      "Show Password",
                                        style: new TextStyle(fontSize:12.0,
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Roboto"),
                                      )
                                    ]
                    
                                  ),
                                    new RaisedButton(key:null, onPressed:()=>buttonPressed(context),
                                    color: const Color(0xFFe0e0e0),

                                    child:
                                      new Text(
                                      "Sign In",
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
                                            forgetPressed(context);
                                          },
                                        child:Text(
                                        "Forget Password? ",
                                          style: new TextStyle(fontSize:12.0,
                                          color: const Color(0xFF6071d0),
                                          fontFamily: "Roboto"),
                                        ),
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
    void showToast(String msg){
        Fluttertoast.showToast(
              msg: msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
    }

    void buttonPressed(context) async {
    FirebaseApp app =
        await Firebase.initializeApp(options: firebaseOptions);
    final DatabaseReference db = FirebaseDatabase(app: app).reference();
    FirebaseAuth auth = FirebaseAuth.instanceFor(app:app);
    if(emailController.text==""){
       showToast("Email Cannot be Empty");
       return;
     }
     if(passwordController.text==""){
       showToast("Password Cannot be Empty");
       return;
     }
    try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:emailController.text,
          password: passwordController.text
        );
        showToast("User Signed In Successfully !");
         Navigator.pushNamedAndRemoveUntil(context,HomePage.routeName , 
            (Route route) => false);
     } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showToast("No user found for that email.");
        } else if (e.code == 'wrong-password') {
          showToast("Wrong password provided for that user.");
        }
      } catch (e) {
        print("Error $e");
      }            
    }

    void createAccountPressed(context){
       Navigator.pushNamedAndRemoveUntil(context,SignUp.routeName , 
            (Route route) => false);
    }
    void forgetPressed(context){
         Navigator.pushNamedAndRemoveUntil(context,ForgetPwd.routeName , 
            (Route route) => false);
    }
    
}

