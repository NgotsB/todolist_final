import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/interceptor/models/api_response.model.dart';
import '../../app/strings/texts.dart';
import '../../app/widgets/progress_dialog.dart';
import '../../app/widgets/toaster.dart';
import '../../services/auth.service.dart';
import '../login/login.dart';

class RegistrationController extends GetxController {

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  register(context) async {

    if (firstNameController.text.isEmpty) {
      Toaster.error("First Name is Required!");
      return;
    }

    if (lastNameController.text.isEmpty) {
      Toaster.error("Last Name is Required!");
      return;
    }

    if (emailController.text.isEmpty) {
      Toaster.error("Student ID is Required!");
      return;
    }

    if (passwordController.text.isEmpty) {
      Toaster.error("Password is Required!");
      return;
    }


    Map body = {
      "email": emailController.text,
      "firstname": firstNameController.text,
      "lastname": lastNameController.text,
      "password": passwordController.text
    };

    ProgressDialog.spin(context, Texts.loading);

    AuthService authService = AuthService("");
    ApiResponse response = await authService.register(body);

    ProgressDialog.stop(context);

    if (response.success) {
      firstNameController.text = "";
      lastNameController.text = "";
      emailController.text = "";
      passwordController.text = "";

      await AwesomeDialog(
        context: context,
        animType: AnimType.TOPSLIDE,
        dialogType: DialogType.SUCCES,
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: true,
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(Texts.emailVerification,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
        title: Texts.success,
        btnOkText: "Go Back To Login",
        btnOkOnPress: () {
          Get.offAll(Login());
        },
      ).show();
    }
  }
}