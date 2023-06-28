import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../app/config/app_colors.dart';
import '../../app/config/app_images.dart';
import '../../app/strings/buttons.dart';
import '../../app/strings/errors.dart';
import '../../app/strings/hints.dart';
import '../../app/strings/labels.dart';
import '../../app/strings/texts.dart';
import '../registration/registration.dart';
import '../shared/widgets/buttons/primary_button.dart';
import '../shared/widgets/forms/form_input.dart';
import 'login.controller.dart';

class Login extends StatelessWidget {

  final double? width;
  final double? height;
  final double? marginBottom;

  Login({
    this.width,
    this.height,
    this.marginBottom,
    Key? key}) : super(key: key);

  final lc = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    double containerWidth = 500;

    if (size.width <= 250) {
      containerWidth = size.width - 40;
    }

    return Stack(
      children: [
        Align(
          alignment: const Alignment(0, 0),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bg),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
        WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
              backgroundColor: Colors.white12.withOpacity(0.2),
              body: Form(
                key: lc.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0),
                  children: [
                    SizedBox(height: size.height / 10),
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                          width: containerWidth,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Hero(
                                tag: 'App Logo',
                                child: Center(
                                  child: Image.asset(AppImages.logo, width: size.width / 2.5),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                Texts.loginTitle,
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                Texts.loginSubTitle,
                                style: TextStyle(
                                    color: AppColors.mutedText,
                                    fontSize: 16
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 35),
                              Container(
                                width: containerWidth,
                                margin: const EdgeInsets.only(left: 20, right: 20),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  child: FormInput(
                                      controller: lc.emailController,
                                      inputType: TextInputType.text,
                                      labelText: Labels.emailAddress,
                                      hintText: Hints.email,
                                      prefixIcon: const Icon(CupertinoIcons.person_alt_circle),
                                      validator: (value) => value == '' ? ErrorString.invalidUsername : null
                                  ),
                                ),
                              ),
                              Container(
                                width:  containerWidth,
                                margin: const EdgeInsets.only(left: 20, right: 20),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                  child: Obx(() => FormInput(
                                      controller: lc.passwordController,
                                      inputType: TextInputType.text,
                                      obscureText: !lc.isShowPassword.value,
                                      labelText: Labels.password,
                                      hintText: Hints.password,
                                      prefixIcon: const Icon(CupertinoIcons.padlock),
                                      validator: (value) => value == '' ? ErrorString.invalidPassword : null,
                                      suffixIcon: IconButton(
                                        splashColor: Colors.transparent,
                                        icon: Icon(lc.isShowPassword.value ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                                        onPressed: () {
                                          lc.isShowPassword.value = !lc.isShowPassword.value;
                                          lc.update();
                                        },
                                      )
                                  )),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                width: containerWidth,
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't have account yet?",
                                    style: TextStyle(color: Colors.black87)),
                                    const SizedBox(width: 2),
                                    InkWell(
                                      child: const Text(
                                        Buttons.signUp,
                                        style: TextStyle(color: AppColors.primary),
                                        textAlign: TextAlign.right,
                                      ),
                                      onTap: () {
                                        Get.to(() => Registration());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height / 10),
                              Container(
                                width: containerWidth,
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                child: PrimaryButton(
                                  text: lc.isLoading.value ? Texts.authenticating : Buttons.signIn.toUpperCase(),
                                  height: 50,
                                  isNormal: false,
                                  isLoading: lc.isLoading.value,
                                  borderRadius: BorderRadius.circular(20.0),
                                  onPressed: () {
                                    if (lc.formKey.currentState!.validate()) {
                                      lc.login(context);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        )
      ],
    );
  }
}