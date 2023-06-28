import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../app/interceptor/models/api_response.model.dart';
import '../../app/storage/local_storage.dart';
import '../../app/strings/errors.dart';
import '../../app/strings/texts.dart';
import '../../app/widgets/progress_dialog.dart';
import '../../app/widgets/toaster.dart';
import '../../locator.dart';
import '../../services/auth.service.dart';
import '../dashboard/dashboard.dart';

class LoginController extends GetxController {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isShowPassword = false.obs;
  var isLoading = false.obs;

  AuthService authService = AuthService();

  login(context) async {
    isLoading.value = true;
    ProgressDialog.spin(context, Texts.authenticating);

    Map payload = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    ApiResponse response = await authService.authenticate(payload);

    isLoading.value = false;
    ProgressDialog.stop(context);
    if (response.success) {


      await locator<LocalStorage>().setToken(response.data!['token']);
      await locator<LocalStorage>()
          .setUserDetails(json.encode(response.data!['user']));

      emailController.text = "";
      passwordController.text = "";

      Navigator.push(context, PageTransition(
          type: PageTransitionType.rightToLeft,
          child: Dashboard()
      ));
    } else {
      Toaster.error(response.message ?? ErrorString.unexpectedError);
    }
  }
}