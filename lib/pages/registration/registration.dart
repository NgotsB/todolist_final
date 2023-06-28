import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/registration/registration.controller.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/app_images.dart';
import '../../app/strings/buttons.dart';
import '../../app/strings/labels.dart';
import '../login/login.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);

  final rc = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    double containerWidth = size.width;

    if (size.width <= 300) {
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
        Scaffold(
          backgroundColor: Colors.white12.withOpacity(0.2),
          body: ListView(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0),
            children: [
              Hero(
                tag: 'App Logo',
                child: Center(
                  child: Image.asset(AppImages.logo, width: size.width / 2.5),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Register",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Create account",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                width: containerWidth,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 0.1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    style: const TextStyle(color: AppColors.dark),
                    controller: rc.emailController,
                    onFieldSubmitted: (val) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      labelText: Labels.emailAddress,
                      labelStyle:
                      const TextStyle(color: AppColors.dark, fontSize: 15),
                      hintText: Labels.emailAddress,
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    cursorColor: AppColors.tertiary,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: containerWidth,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 0.1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    style: const TextStyle(color: AppColors.dark),
                    controller: rc.firstNameController,
                    onFieldSubmitted: (val) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      labelText: Labels.firstName,
                      labelStyle:
                      const TextStyle(color: AppColors.dark, fontSize: 15),
                      hintText: Labels.firstName,
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    cursorColor: AppColors.tertiary,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: containerWidth,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 0.1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    style: const TextStyle(color: AppColors.dark),
                    controller: rc.lastNameController,
                    onFieldSubmitted: (val) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      labelText: Labels.lastName,
                      labelStyle:
                      const TextStyle(color: AppColors.dark, fontSize: 15),
                      hintText: Labels.lastName,
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    cursorColor: AppColors.tertiary,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  width: containerWidth,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 0.1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    obscureText: true,
                    style: const TextStyle(color: AppColors.dark),
                    onFieldSubmitted: (val) {},
                    controller: rc.passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      labelText: Labels.password,
                      labelStyle:
                      const TextStyle(color: AppColors.dark, fontSize: 15),
                      hintText: Labels.password,
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    cursorColor: AppColors.tertiary,
                  )),
              const SizedBox(height: 50.0),
              Container(
                height: 45,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: const BorderSide(color: AppColors.primary)))),
                  onPressed: () {
                    rc.register(context);
                  },
                  child: const Text(Buttons.signUpHere,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Go Back to " , style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 2),
                  InkWell(
                    child: const Text(Buttons.signIn,
                      style: TextStyle(color: AppColors.primary),
                    ),
                    onTap: () {
                      Get.to(() => Login());
                    },
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
