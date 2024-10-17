import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_converter/View/Screens/iOS/iOSHomeScreen/IOSChatPage.dart';
import 'package:platform_converter/View/Screens/iOS/iOSHomeScreen/iOSaddContactPage.dart';

import '../../../../main.dart';
import 'IOSCallPage.dart';
import 'IOSSettingPage.dart';

class IOSHomePage extends StatelessWidget {
  const IOSHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cupertino App',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
        ),
        actions: [
          Obx(() => CupertinoSwitch(
                value: platformController.isAndroid.value,
                onChanged: (value) {
                  platformController.togglePlatform(value);
                },
              )),
        ],
      ),
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2), label: 'CHATS'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone), label: 'CALLS'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: 'SETTINGS'),
          ],
          activeColor: CupertinoColors.activeBlue,
          inactiveColor: CupertinoColors.inactiveGray,
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return const IOSAddContactPage();
            case 1:
              return const IOSCallPage();
            case 2:
              return const IOSChatPage();
            case 3:
              return const IOSSettingPage();
            default:
              return Container();
          }
        },
      ),
    );
  }
}
