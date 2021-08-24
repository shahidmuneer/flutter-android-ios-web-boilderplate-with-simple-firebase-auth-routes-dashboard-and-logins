
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:web/SignIn.dart';
import 'package:web/pages/auth/SignUp.dart';
import 'package:web/pages/auth/ForgetPwd.dart';
import 'package:web/pages/auth/SignUpSuccess.dart';
import 'package:web/page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (context) => MyHomePage(),
        // SignIn.routeName: (context) => SignIn()
      },
      initialRoute: MyHomePage.routeName,
      onGenerateRoute: (RouteSettings settings) {
        var page;
        String routeName = settings.name!;
        switch (routeName) {
          case SignIn.routeName:
            page = SignIn(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;

          case SignUp.routeName:
            page = SignUp(
              data: settings.arguments,
            );
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
   Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("users")
        .doc("docID")
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Home"),
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
