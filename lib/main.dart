import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:platform_converter/View/Screens/Android/androidHomeScreen/androidHomePage.dart';
import 'package:platform_converter/View/Screens/Auth/LoginScreen.dart';
import 'package:platform_converter/View/Screens/Auth/SignUpScreen.dart';
import 'Services/AuthService.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AndroidHomePage(),
      routes: {
        '/': (context) => CheckUser(),
        '/login': (context) => LoginPage(),
        '/androidHome': (context) => AndroidHomePage(),
        '/signUp': (context) => SignUpPage(),
      },
    );
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

/*
class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return (FirebaseAuth.instance.currentUser!.email == null)
        ? LoginPage()
        : AndroidHomePage();
  }
}
*/
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
