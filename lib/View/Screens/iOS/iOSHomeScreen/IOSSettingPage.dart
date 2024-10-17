import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Services/AuthService.dart';

class IOSSettingPage extends StatelessWidget {
  const IOSSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            child: Text(
              FirebaseAuth.instance.currentUser!.email
                  .toString()[0]
                  .toUpperCase(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            FirebaseAuth.instance.currentUser!.email.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          CupertinoListTile(
            onTap: () {
              AuthService().logout();
              Navigator.pushReplacementNamed(context, "/login");
            },
            leading: Icon(
              Icons.logout_outlined,
            ),
            title: Text('Log Out'),
          )
        ],
      ),
    );
  }
}
