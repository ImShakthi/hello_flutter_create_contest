import 'package:flutter/material.dart';

class SimpleDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("hello_flutter@gmail.com"),
            accountName: Text("Hello Flutter"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/musical.png'),
            ),
          ),
          ListTile(
            title: Text("Option 1"),
            leading: CircleAvatar(child: Text("1")),
          ),
          ListTile(
            title: Text("Option 2"),
            leading: CircleAvatar(child: Text("2")),
          ),
        ],
      ),
    );
  }
}
