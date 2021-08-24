import 'package:flutter/material.dart';
import "package:web/pages/auth/SignUp.dart";
import "package:web/pages/auth/SignIn.dart";
import "package:web/pages/Dashboard/HomePage.dart";
import "package:web/pages/auth/SignUpSuccess.dart";
import "package:web/pages/auth/ForgetPwd.dart";
import 'package:firebase_auth/firebase_auth.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Sarah Abs';
    final email = 'sarah@abs.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(245,245,245,1),
        child: ListView(
          children: <Widget>[
            Image.network("https://i.ibb.co/N2cGJHD/Sans-titre.webp"),
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => {},
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  // const SizedBox(height: 24),
                  // buildMenuItem(
                  //   text: 'Sign In',
                  //   icon: Icons.people,
                  //   onClicked: () => selectedItem(context, "0"),
                  // ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Home Page',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, "1"),
                  ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Workflow',
                  //   icon: Icons.workspaces_outline,
                  //   onClicked: () => selectedItem(context, "2"),
                  // ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Updates',
                  //   icon: Icons.update,
                  //   onClicked: () => selectedItem(context, "3"),
                  // ),
                  // const SizedBox(height: 24),
                  Divider(color: Colors.black),
                  // const SizedBox(height: 24),
                  // buildMenuItem(
                  //   text: 'Plugins',
                  //   icon: Icons.account_tree_outlined,
                  //   onClicked: () => selectedItem(context, "4"),
                  // ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout ,
                    onClicked: () => selectedItem(context, "logout"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(245, 245, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.black),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.black;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.black12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.black12;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, String index) async{
    Navigator.of(context).pop();

    switch (index) {
      case "0":
        Navigator.pushNamed(context, SignIn.routeName,
                    arguments: "This is some data");
        break;
      case "1":
        Navigator.pushNamed(context, HomePage.routeName,
                    arguments: "This is some data");
        break;
      case "logout":
      await FirebaseAuth.instance.signOut();
      //  Navigator.pushNamed(context, ,
      //               arguments: "This is some data"); 
        Navigator.pushNamedAndRemoveUntil(context,SignIn.routeName , 
            (Route route) => false);
        break;
      
    }
  }
}