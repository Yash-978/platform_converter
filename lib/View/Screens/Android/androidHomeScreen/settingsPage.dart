import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../Services/AuthService.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        ListTile(
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
    );
  }
}
