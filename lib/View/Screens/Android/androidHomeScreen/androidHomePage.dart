/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_converter/Services/AuthService.dart';
import 'package:platform_converter/View/Screens/Android/androidHomeScreen/settingsPage.dart';

import '../../../../main.dart';
import 'CallPage.dart';
import 'ChatPage.dart';
import 'addContactsPage.dart';



class AndroidHomePage extends StatelessWidget {
  const AndroidHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Android App"),
          actions: [
            Obx(() => Switch(
              value: platformController.isAndroid.value,
              onChanged: (value) {
                platformController.togglePlatform(value);
              },
            )),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person_add_alt_1_rounded),
            ),
            Tab(
              icon: Text('Chats'),
            ),
            Tab(
              icon: Text('Call'),
            ),
            Tab(
              icon: Text('Settings'),
            ),
          ]),
        ),
        body: TabBarView(children: [
          AddContact(),
          ChatPage(),
          CallPage(),
          SettingsPage(),
        ]),
      ),
    );
  }
}
*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_converter/Services/AuthService.dart';
import 'package:platform_converter/View/Screens/Android/androidHomeScreen/settingsPage.dart';

import '../../../../main.dart';
import 'CallPage.dart';
import 'ChatPage.dart';
import 'addContactsPage.dart';

TextEditingController txtName = TextEditingController();
TextEditingController txtPhone = TextEditingController();
TextEditingController txtChatConversation = TextEditingController();
TextEditingController txtEmail = TextEditingController();

class AndroidHomePage extends StatelessWidget {
  const AndroidHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Android App"),
          actions: [
            Obx(() => Switch(
              value: platformController.isAndroid.value,
              onChanged: (value) {
                platformController.togglePlatform(value);
              },
            )),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person_add_alt_1_rounded),
            ),
            Tab(
              icon: Text('Chats'),
            ),
            Tab(
              icon: Text('Call'),
            ),
            Tab(
              icon: Text('Settings'),
            ),
          ]),
        ),
        body: TabBarView(children: [
          AddContact(),
          ChatPage(),
          CallPage(),
          SettingsPage(),
        ]),
      ),
    );
  }
}