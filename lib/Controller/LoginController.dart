import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
{
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool obscure = false.obs;
  final RxBool _obscure = false.obs;
  RxBool rememberMeCheck = false.obs;
  RxBool isSignUp = false.obs;

  void obscureCheck() {
    _obscure.value = !_obscure.value;
  }


}