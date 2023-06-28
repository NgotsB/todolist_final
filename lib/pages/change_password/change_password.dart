import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/strings/buttons.dart';
import '../../app/strings/labels.dart';
import '../../app/strings/texts.dart';
import '../shared/widgets/buttons/app_back_button.dart';
import '../shared/widgets/buttons/primary_button.dart';
import '../shared/widgets/containers/app_bar_title.dart';
import '../shared/widgets/containers/header_title.dart';
import '../shared/widgets/forms/form_input.dart';
import 'change_password.controller.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  final cpc = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          leading: const AppBackButton(),
          backgroundColor: Colors.white,
          title: const AppBarTitle(
            title: "Change Password",
          )
      ),
      body: Form(
        key: cpc.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            const HeaderTitle(
                icon: CupertinoIcons.padlock_solid,
                title: Texts.updatePasswordMessage
            ),
            FormInput(
              controller: cpc.passwordController,
              inputType: TextInputType.text,
              labelText: Labels.oldPassword,
              obscureText: true,
              prefixIcon: null,
              validator: (value) => value == '' ? "Invalid old password" : null,
              enabled: !cpc.isLoading.value,
              onSubmit: (value) => cpc.onChangePassword(context),
              marginTop: 15,
              marginBottom: 15,
              radius: 10,
            ),
            FormInput(
              controller: cpc.newPasswordController,
              inputType: TextInputType.text,
              labelText: Labels.newPassword,
              obscureText: true,
              prefixIcon: null,
              validator: (value) => value == '' ? "Invalid new password" : null,
              enabled: !cpc.isLoading.value,
              onSubmit: (value) => cpc.onChangePassword(context),
              marginBottom: 15,
              radius: 10,
            ),
            FormInput(
              controller: cpc.confirmPasswordController,
              inputType: TextInputType.text,
              labelText: Labels.confirmPassword,
              obscureText: true,
              prefixIcon: null,
              validator: (value) {
                if (value == '') {
                  return "Invalid Confirm Password!";
                }

                if (value != cpc.newPasswordController.text) {
                  return "Password Mismatch!";
                }

                return null;
              },
              enabled: !cpc.isLoading.value,
              onSubmit: (value) => cpc.onChangePassword(context),
              marginBottom: 50,
              radius: 10,
            ),
            PrimaryButton(
              text: cpc.isLoading.value ? Texts.loading : Buttons.changePassword,
              height: 45,
              isNormal: false,
              isLoading: cpc.isLoading.value,
              borderRadius: BorderRadius.circular(10.0),
              onPressed: () {
                if (cpc.formKey.currentState!.validate()) {
                  cpc.onChangePassword(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
