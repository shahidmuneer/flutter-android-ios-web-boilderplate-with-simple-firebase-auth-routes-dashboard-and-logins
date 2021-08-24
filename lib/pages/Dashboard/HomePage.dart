import 'package:flutter/material.dart';
import 'package:web/pages/auth/SignUp.dart';
import 'package:web/pages/auth/SignUpSuccess.dart';
import 'package:web/pages/auth/ForgetPwd.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pie_chart/pie_chart.dart';

import 'package:flutter/foundation.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:web/widget/navigation_drawer_widget.dart';
// import 'package:web/widget/PieSample.dart';

class HomePage extends StatefulWidget {  
  final data;
  static const String routeName = "/HomePage";
  HomePage({this.data});
  _HomePageState createState() => _HomePageState();  
}  


enum LegendShape { Circle, Rectangle }

class _HomePageState extends State<HomePage> {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  ChartType? _chartType = ChartType.disc;
  bool _showCenterText = true;
  double? _ringStrokeWidth = 32;
  double? _chartLegendSpacing = 32;

  bool _showLegendsInRow = false;
  bool _showLegends = true;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  LegendShape? _legendShape = LegendShape.Circle;
  LegendPosition? _legendPosition = LegendPosition.right;
  int key = 0;
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
    
        Map<String, double> dataMap = {
            "Flutter": 5,
            "React": 3,
            "Xamarin": 2,
            "Ionic": 2,
          };
      return new Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: new AppBar(
          title: new Text('Home page'),
        //   leading: IconButton(
        //   icon: Icon(Icons.accessible),
        //   onPressed: () => {},
        // ),
          ),
        body:
         new SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(50.0),
          child:
          new Container(
            child:
                new Container(
                  child:
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                        "My Models",
                          style: new TextStyle(fontSize:41.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                        ),
      
                        new SizedBox(
                          width: 100.0,
                          height: 100.0,
                        ),
                        new SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(50.0),
                          child:
                                    new Row(
                                      children:<Widget>[
                                              _buildPieCard(),
                                              _buildPieCard()
                                      ]),
                         )
                      ]
      
                    ),
                ),
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
              ),
    
          ),
    
      );
    }

    Card _buildPieCard(){
      return Card(key: null,
                          child:
                                                  new Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      new Row(
                                                       children: <Widget>[
                                                          new Text(
                                                            "Model # 1: ",
                                                              style: new TextStyle(fontSize:12.0,
                                                              color: const Color(0xFF000000),
                                                              fontWeight: FontWeight.w200,
                                                              fontFamily: "Roboto"),
                                                            ),
                                                            new TextButton(
                                                                    onPressed: () {
                                                                      createAccountPressed(context);
                                                                    },
                                                                            child: Text(
                                                                            "Add More Data",
                                                                              style: new TextStyle(fontSize:12.0,
                                                                              color: const Color(0xFFff0000),
                                                                              fontWeight: FontWeight.w200,
                                                                              fontFamily: "Roboto"),
                                                                      )
                                                                  ),
                                                                  IconButton(
                                                                      icon: const Icon(Icons.delete),
                                                                      tooltip: 'delete',
                                                                      onPressed: () {
                                                                        // setState(() {
                                                                        //   // _volume += 10;
                                                                        // });
                                                                      },
                                                                    ),
                                                                  IconButton(
                                                                      icon: const Icon(Icons.settings),
                                                                      tooltip: 'Settings',
                                                                      onPressed: () {
                                                                        // setState(() {
                                                                        //   // _volume += 10;
                                                                        // });
                                                                      },
                                                                    ),
                                                                  ]
                                                            ),
                                                      Divider(height: 20,
                                                              thickness: 5,
                                                              indent: 20,
                                                              endIndent: 20,
                                                              color: Colors.black),
                                                      _buildCircularChart(),
                                                       new Divider(
                                                        color: Colors.red,
                                                      ),
                                                      new Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start, 
                                                         verticalDirection: VerticalDirection.down, 
                                                        children:<Widget>[
                                                          new Row(
                                                            children:<Widget>[
                                                                new Text(
                                                                            "500 Images",
                                                                              style: new TextStyle(fontSize:24.0,
                                                                              color: const Color(0xFF000000),
                                                                              fontWeight: FontWeight.w200,
                                                                              fontFamily: "Roboto"),
                                                                      ),
                                                                    new Text(
                                                                            "(C1: abc image, C2: Abc2 images )",
                                                                              style: new TextStyle(fontSize:12.0,
                                                                              color: const Color(0xFF000000),
                                                                              fontWeight: FontWeight.w200,
                                                                              fontFamily: "Roboto"),
                                                                      )]),
                                                                      new Row(
                                                                           children:<Widget>[
                                                                              new Text(
                                                                                          "120 Videos",
                                                                                            style: new TextStyle(fontSize:24.0,
                                                                                            color: const Color(0xFF000000),
                                                                                            fontWeight: FontWeight.w200,
                                                                                            fontFamily: "Roboto"),
                                                                                    ),
                                                                                  new Text(
                                                                                          "(C1: abc image, C2: Abc2 images )",
                                                                                            style: new TextStyle(fontSize:12.0,
                                                                                            color: const Color(0xFF000000),
                                                                                            fontWeight: FontWeight.w200,
                                                                                            fontFamily: "Roboto"),
                                                                                    )]),
                                                            
                                                                                  new Row(
                                                                                    children:<Widget>[
                                                                                            new Text(
                                                                                                    "Data Plot Debug",
                                                                                                      style: new TextStyle(fontSize:24.0,
                                                                                                      color: const Color(0xFF000000),
                                                                                                      fontWeight: FontWeight.w200,
                                                                                                      fontFamily: "Roboto"),
                                                                                              )
                                                                                          ]),
                                                                  
                                                                                  new Row(
                                                                                    children:<Widget>[
                                                                                            new Text(
                                                                                                    "0.05% Images",
                                                                                                      style: new TextStyle(fontSize:24.0,
                                                                                                      color: const Color(0xFF000000),
                                                                                                      fontWeight: FontWeight.w200,
                                                                                                      fontFamily: "Roboto"),
                                                                                              )]),
                                                                                new Row(
                                                                                    children:<Widget>[
                                                                                            new Text(
                                                                                                    "0.95% Accuracy",
                                                                                                      style: new TextStyle(fontSize:24.0,
                                                                                                      color: const Color(0xFF000000),
                                                                                                      fontWeight: FontWeight.w200,
                                                                                                      fontFamily: "Roboto"),
                                                                                              )])          
                                                        ]
                                                      )
                                                      ]
                                                    ),
                                                );
    }
     /// Get default circular chart
   PieChart _buildCircularChart() {

    return PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
          ? 300
          : MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      centerText: _showCenterText ? "HYBRID" : null,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
    );
    final settings = SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Pie Chart Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ListTile(
              title: Text("chartType"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<ChartType>(
                  value: _chartType,
                  items: [
                    DropdownMenuItem(
                      child: Text("disc"),
                      value: ChartType.disc,
                    ),
                    DropdownMenuItem(
                      child: Text("ring"),
                      value: ChartType.ring,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _chartType = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text("ringStrokeWidth"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<double>(
                  value: _ringStrokeWidth,
                  disabledHint: Text("select chartType.ring"),
                  items: [
                    DropdownMenuItem(
                      child: Text("16"),
                      value: 16,
                    ),
                    DropdownMenuItem(
                      child: Text("32"),
                      value: 32,
                    ),
                    DropdownMenuItem(
                      child: Text("48"),
                      value: 48,
                    ),
                  ],
                  onChanged: (_chartType == ChartType.ring)
                      ? (val) {
                          setState(() {
                            _ringStrokeWidth = val;
                          });
                        }
                      : null,
                ),
              ),
            ),
            SwitchListTile(
              value: _showCenterText,
              title: Text("showCenterText"),
              onChanged: (val) {
                setState(() {
                  _showCenterText = val;
                });
              },
            ),
            ListTile(
              title: Text("chartLegendSpacing"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<double>(
                  value: _chartLegendSpacing,
                  disabledHint: Text("select chartType.ring"),
                  items: [
                    DropdownMenuItem(
                      child: Text("16"),
                      value: 16,
                    ),
                    DropdownMenuItem(
                      child: Text("32"),
                      value: 32,
                    ),
                    DropdownMenuItem(
                      child: Text("48"),
                      value: 48,
                    ),
                    DropdownMenuItem(
                      child: Text("64"),
                      value: 64,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _chartLegendSpacing = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Legend Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              value: _showLegendsInRow,
              title: Text("showLegendsInRow"),
              onChanged: (val) {
                setState(() {
                  _showLegendsInRow = val;
                });
              },
            ),
            SwitchListTile(
              value: _showLegends,
              title: Text("showLegends"),
              onChanged: (val) {
                setState(() {
                  _showLegends = val;
                });
              },
            ),
            ListTile(
              title: Text("legendShape"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<LegendShape>(
                  value: _legendShape,
                  items: [
                    DropdownMenuItem(
                      child: Text("BoxShape.circle"),
                      value: LegendShape.Circle,
                    ),
                    DropdownMenuItem(
                      child: Text("BoxShape.rectangle"),
                      value: LegendShape.Rectangle,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _legendShape = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text("legendPosition"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<LegendPosition>(
                  value: _legendPosition,
                  items: [
                    DropdownMenuItem(
                      child: Text("left"),
                      value: LegendPosition.left,
                    ),
                    DropdownMenuItem(
                      child: Text("right"),
                      value: LegendPosition.right,
                    ),
                    DropdownMenuItem(
                      child: Text("top"),
                      value: LegendPosition.top,
                    ),
                    DropdownMenuItem(
                      child: Text("bottom"),
                      value: LegendPosition.bottom,
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _legendPosition = val;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Chart values Options'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              value: _showChartValueBackground,
              title: Text("showChartValueBackground"),
              onChanged: (val) {
                setState(() {
                  _showChartValueBackground = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValues,
              title: Text("showChartValues"),
              onChanged: (val) {
                setState(() {
                  _showChartValues = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValuesInPercentage,
              title: Text("showChartValuesInPercentage"),
              onChanged: (val) {
                setState(() {
                  _showChartValuesInPercentage = val;
                });
              },
            ),
            SwitchListTile(
              value: _showChartValuesOutside,
              title: Text("showChartValuesOutside"),
              onChanged: (val) {
                setState(() {
                  _showChartValuesOutside = val;
                });
              },
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Pie Chart @apgapg"),
    //     actions: [
    //       RaisedButton(
    //         onPressed: () {
    //           setState(() {
    //             key = key + 1;
    //           });
    //         },
    //         child: Text("Reload".toUpperCase()),
    //       ),
    //     ],
    //   ),
    //   body: LayoutBuilder(
    //     builder: (_, constraints) {
    //       if (constraints.maxWidth >= 600) {
            // return Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Flexible(
            //       flex: 2,
            //       fit: FlexFit.tight,
            //       child: chart,
            //     ),
            //     Flexible(
            //       flex: 1,
            //       child: settings,
            //     )
            //   ],
            // );
          // } else {
            // return SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       Container(
            //         child: chart,
            //         margin: EdgeInsets.symmetric(
            //           vertical: 32,
            //         ),
            //       ),
            //       settings,
            //     ],
            //   ),
            // );
    //       }
    //     },
    //   ),
    // );
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



