

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:web/widget/navigation_drawer_widget.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'dart:convert';
import 'dart:io';

import 'package:web/pages/auth/SignIn.dart';
import 'package:web/pages/auth/SignUp.dart';
import 'package:web/pages/auth/ForgetPwd.dart';
import 'package:web/pages/auth/SignUpSuccess.dart';
import 'package:web/pages/Dashboard/HomePage.dart';
import 'package:web/page3.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
);
void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  enablePlatformOverrideForDesktop();
  //  await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);etchUser().then((user) {
    // if (user != null) runApp(MyApp(page: 'home'));
    // else runApp(MyApp(page: 'login'));
  // });
    FirebaseApp app =
    await Firebase.initializeApp(options: firebaseOptions);
    // auth = await FirebaseAuth.instanceFor(app:app);
    runApp(MyApp());
}
class MyApp extends StatelessWidget {
    
  bool loggedIn(){
    return FirebaseAuth.instance.currentUser!=null;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: const Color(0xFF00bcd4),
        accentColor: const Color(0xFF00bcd4),
        canvasColor: const Color(0xFFfafafa),
      ),
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (context) => MyHomePage(),
        // SignIn.routeName: (context) => SignIn()
      },
      // future:Authenticated(),
      initialRoute: SignIn.routeName,
      onGenerateRoute: (RouteSettings settings) {
        var page;
        String routeName = settings.name!;
        switch (routeName) {
          case SignIn.routeName:
          if(!loggedIn()){
                page = SignIn(
                  data: settings.arguments,
                );
          }else{
                page = HomePage(
                  data: settings.arguments,
                );
          }

            return MaterialPageRoute(builder: (context) => page);
            break;

          case SignUp.routeName:
          if(!loggedIn()){
                page = SignUp(
                  data: settings.arguments,
                );
          }else{
                page = HomePage(
                  data: settings.arguments,
                );
          }
            return MaterialPageRoute(builder: (context) => page);
            break;

            
          case ForgetPwd.routeName:
            page = ForgetPwd(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;

          case SignUpSuccess.routeName:
            page = SignUpSuccess(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
          case HomePage.routeName:

          if(loggedIn()){
                page = HomePage(
                  data: settings.arguments,
                );
          }else{
                page = SignIn(
                  data: settings.arguments,
                );
          }
            return MaterialPageRoute(builder: (context) => page);
            break;
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        var page;
        page = Page3(data: settings.arguments);

        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/";
  final String title="Shahid";

  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name="my app";
  // final databaseRef = FirebaseDatabase.instance.reference();
  FirebaseOptions get firebaseOptions => const FirebaseOptions(
        appId: '',
        apiKey: '',
        projectId: '',
        messagingSenderId: '',
      );
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    assert(app != null);
    
    
    print('Initialized default app $app');
  }
  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) =>  random.nextInt(255));
    return base64UrlEncode(values);
  }
  Future<void> initializeSecondary() async {
    FirebaseApp app =
        await Firebase.initializeApp(options: firebaseOptions);
    final DatabaseReference db = FirebaseDatabase(app: app).reference();
     
    Scaffold.of(context).openDrawer();
    FirebaseAuth auth = FirebaseAuth.instanceFor(app:app);
    assert(app != null);
    //  FirebaseDatabaseWeb.instance
    //                 .reference()
    //                 .child("Users")
    //                 .child(getRandString(10))
    //                 .set({
    //                     "name": "shahid",
    //                     "email": "shahid@gmail.com",
    //                     "password": "thiswon'twork"
    //                   });
    // await FirebaseDatabaseWeb.instance
    //                 .reference()
    //                 .child("Users")
    //                 .once().then((result) => print(result.value));

    // await db.child('Users').once();//.then((result) => print('result = $result'));
    // FirebaseAuth.instance
    //     .authStateChanges()
    //     .listen((User? user) {
    //       if (user == null) {
    //         print('User is currently signed out!');
    //       } else {
    //         print('User is signed in!');
    //       }
    //     });
    
     
    
    print('Initialized $app');
  }

  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions options = app.options;
    print('Current options for app $name: $options');
  }

  Future<void> delete() async {
    final FirebaseApp app = Firebase.app(name);
    await app.delete();
    print('App $name deleted');
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(widget.title!=null?"Home":""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                  onPressed: initializeDefault,
                  child: const Text('Initialize default app')),
              ElevatedButton(
                  onPressed: initializeSecondary,
                  child: const Text('Initialize secondary app')),
              ElevatedButton(onPressed: apps, child: const Text('Get apps')),
              ElevatedButton(
                  onPressed: options, child: const Text('List options')),
              ElevatedButton(
                  onPressed: delete, child: const Text('Delete app')),
            ],
          ),
        ),
            FlatButton(
              child: Text("Go to Page 1"),
              onPressed: () {
                Navigator.pushNamed(context, SignIn.routeName,
                    arguments: "This is some data");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
