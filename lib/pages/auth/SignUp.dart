import 'package:flutter/material.dart';
import 'package:web/pages/auth/SignIn.dart';
import 'package:web/pages/auth/SignUpSuccess.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'dart:math';
import 'dart:convert';
class SignUp extends StatefulWidget {  
  final data;
  static const String routeName = "/SignUp";
    SignUp({this.data});
  _SignUpState createState() => _SignUpState();  
  }  


class _SignUpState extends State<SignUp> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordAgainController = new TextEditingController();
  TextEditingController companyController = new TextEditingController();
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
          title: new Text('Register'),
          ),
        body:
        new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(50.0),
                    child:
          new Container(
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
                                  "Create your Neurobtx Account",
                                    style: new TextStyle(fontSize:32.0,
                                    color: const Color(0xFF6f4949),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                  ),
                                  new TextField(
                                    controller:nameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Full Name',
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
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email Address',
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
                                    obscureText: true,
                                    style: new TextStyle(fontSize:12.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 25.0),
                                  ),
                                  new TextField(
                                    controller:passwordAgainController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password (again)',
                                    ),
                                    obscureText: true,
                                    style: new TextStyle(fontSize:12.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 25.0),
                                  ),
                                  new TextField(
                                    controller:companyController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Company, Industry or Role',
                                    ),
                                    style: new TextStyle(fontSize:12.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Merriweather"),
                                  ),
                                  
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                     new Checkbox(key:null, value:checkedValue,onChanged: (bool? value) {    
                                                                                       if (value != null) {
                                                                                            setState((){checkedValue = value;});
                                                                                       }
                                     }),
                                      new Text(
                                      "I have read and accept the terms & conditions",
                                        style: new TextStyle(fontSize:12.0,
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Roboto"),
                                      )
                                    ]
                    
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
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
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                      "Already have an account? ",
                                        style: new TextStyle(fontSize:12.0,
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Roboto"),
                                      ),
                                       new TextButton(
                                          onPressed: () {
                                            LogInPressed(context);
                                          },
                                          child: Text(
                                            'Sign In', //title
                                            textAlign: TextAlign.end, //aligment
                                              style: new TextStyle(fontSize:12.0,
                                                color: const Color(0xFF6071d0),
                                                fontFamily: "Roboto"),
                                              ),
                                          ),
                                    ]
                    
                                  ),
                                  
                                  new Padding(
                                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                                  ),
                                    new TextButton(
                                          onPressed: () {
                                            LogInPressed(context);
                                          },
                                          child: Text(
                                            'Legal: Privacy Policy | Terms & Conditions', //title
                                            textAlign: TextAlign.end, //aligment
                                              style: new TextStyle(fontSize:12.0,
                                                color: const Color(0xFFff0000),
                                                fontFamily: "Roboto"),
                                              ),
                                          ),
                                ]
                    
                              ),
                      ),
            
    
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 1.0),
            alignment: Alignment.center,
          ),
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

     if(nameController.text==""){
       showToast("Name Cannot be Empty");
       return;
     }
     if(emailController.text==""){
       showToast("Email Cannot be Empty");
       return;
     }
     if(passwordController.text==""){
       showToast("Password Cannot be Empty");
       return;
     }
     if(passwordAgainController.text==""){
       showToast("Password Confirmation Cannot be Empty");
       return;
     }
    if(passwordController.text!=passwordAgainController.text){
        showToast("Password Didn't Matched");
        return;
    }

    if(checkedValue==false){
     showToast("You'll have to read and accept the terms & conditions");
        return; 
    }
    try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:emailController.text,
          password: passwordController.text
        );
        await FirebaseDatabaseWeb.instance
                  .reference()
                  .child("Users")
                  .child(emailController.text)
                  .set({
                      "name": nameController.text,
                      "email": emailController.text,
                      "company":companyController.text
                    });
        showToast("User Signed Up Successfully !");
        Navigator.pushNamed(context, SignUpSuccess.routeName,
                    arguments: "This is some data");
     } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showToast("The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          showToast("The account already exists for that email.");
        }
      } catch (e) {
          print("Error $e");
      }            
    }
  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) =>  random.nextInt(255));
    return base64UrlEncode(values);
  }
    void LogInPressed(context){
       Navigator.pushNamed(context, SignIn.routeName,
                    arguments: "This is some data");
    }
    
    void checkChanged(bool? value){}
    
}

