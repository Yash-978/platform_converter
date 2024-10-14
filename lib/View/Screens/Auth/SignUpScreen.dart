import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_converter/Services/AuthService.dart';
import 'package:platform_converter/View/Screens/Auth/LoginScreen.dart';

/*class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: loginController.formKey,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Email field
                    TextFormField(
                      controller: loginController.txtEmail,
                      style: const TextStyle(fontSize: 15),
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusColor: Colors.blue,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (String? email) {
                        if (email == null) {
                          return null;
                        }
                        bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(email);
                        return emailValid ? null : 'Email is not valid';
                      },
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    // Password field
                    TextFormField(
                      onTap: () {},
                      controller: loginController.txtPassword,
                      obscureText: loginController.obscure.value,
                      style: const TextStyle(fontSize: 15),
                      cursorColor: const Color.fromARGB(255, 176, 72, 99),
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        suffixIcon: Obx(
                          () => Icon(
                            loginController.obscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: loginController.obscure.value
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusColor: const Color.fromARGB(255, 176, 72, 99),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 176, 72, 99)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (String? password) {
                        if (password == null) {
                          return null;
                        }
                        if (password.length < 8) {
                          return "Password must be greater than 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: h * 0.02),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Obx(
                        () => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('Remember me'),
                          tileColor: Colors.white70,
                          tristate: true,
                          value: loginController.rememberMeCheck.value,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            (loginController.rememberMeCheck.value =
                                value ?? false);
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: h * 0.02),
                    Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[200],
                          minimumSize: Size(w * 0.9, h * 0.06),
                          maximumSize: Size(w * 0.9, h * 0.06),
                          shape: StadiumBorder(),
                          textStyle: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        onPressed: () {},
                        child: loginController.isSignUp.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: w * 0.050,
                                  ),
                                  Text(
                                    'Please wait...',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              )
                            : Text(
                                'Login',
                                style: TextStyle(color: Colors.black),
                              ),
                      ),
                    ),
                    SizedBox(height: h * 0.02),

                    SizedBox(
                      width: w * 0.9,
                      height: h * 0.06,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/googleLogo.png",
                              height: 30,
                              width: 30,
                            ),
                            Text("Continue with Google"),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Don't have an account",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed('/signUp');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up '),
      ),
      body: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: w * .9,
              child: TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Email cannot be empty." : null,
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: w * 0.9,
              child: TextFormField(
                validator: (value) => value!.length < 8
                    ? "Password should have at least 8 characters."
                    : null,
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 65,
              width: w * .9,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthService()
                          .createAccountWithEmail(
                          _emailController.text, _passwordController.text)
                          .then((value) {
                        if (value == "Account Created") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Account Created")));
                          Navigator.pushReplacementNamed(context, '/androidHome');
                          // Navigator.pushNamed(context, '/androidHome');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red.shade400,
                          ));
                        }
                      });
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16),
                  ))),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: w * 0.9,
            height: h * 0.06,
            child: OutlinedButton(
              onPressed: () {
                AuthService().continueWithGoogle().then((value) {
                  if (value == "Google Login Successful") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Google Login Successful")));
                    Navigator.pushReplacementNamed(context, "/androidHome");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red.shade400,
                    ));
                  }
                });

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/googleLogo.png",
                    height: 30,
                    width: 30,
                  ),
                  Text("Continue with Google"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have Account!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthService()
                          .createAccountWithEmail(
                              _emailController.text, _passwordController.text)
                          .then(
                        (value) {
                          if (value == "Account Created") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Account Created")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red.shade400,
                              ),
                            );
                          }
                        },
                      );
                    }
                    // Navigator.pushNamed(context, "/signUp");
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
