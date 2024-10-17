import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:platform_converter/View/Screens/Android/androidHomeScreen/androidHomePage.dart';
import 'package:platform_converter/View/Screens/Auth/LoginScreen.dart';
import 'package:platform_converter/View/Screens/Auth/SignUpScreen.dart';
import 'Controller/platformConverterConverter.dart';
import 'Services/AuthService.dart';
import 'View/Screens/iOS/iOSHomeScreen/iOSHomePage.dart';
import 'firebase_options.dart';

final PlatformController platformController = Get.put(PlatformController());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Controller for managing platform state

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Platform Switcher'),
        //   actions: [
        //     Obx(() => Switch(
        //           value: platformController.isAndroid.value,
        //           onChanged: (value) {
        //             platformController.togglePlatform(value);
        //           },
        //         )),
        //     const Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Text('Android'),
        //     ),
        //   ],
        body: Obx(() => platformController.isAndroid.value
            ? const AndroidHomePage()
            : const IOSHomePage()),
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/androidHome': (context) => const AndroidHomePage(),
        '/iosHome': (context) => const IOSHomePage(),
      },
    );
    // ),
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App bar'),
      ),
    );
  }
}


class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return LoginPage();
    } else {
      return AndroidHomePage();
    }
  }
}
