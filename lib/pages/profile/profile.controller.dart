import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../app/interceptor/models/api_response.model.dart';
import '../../app/storage/local_storage.dart';
import '../../app/widgets/progress_dialog.dart';
import '../../app/widgets/toaster.dart';
import '../../locator.dart';
import '../../models/user.model.dart';
import '../../services/user.service.dart';


class ProfileController extends GetxController {

  String? token;

  var user = User().obs;
  var isLoading = false.obs;
  late UserService userService;

  var usernameController = TextEditingController();

  @override
  void onInit() async {
    token = await locator<LocalStorage>().getToken();
    userService = UserService(token);

    var userRawData = await locator<LocalStorage>().getUserDetails();
    user.value = User.fromJson(await json.decode(userRawData));

    usernameController.text = user.value.username!;

    super.onInit();
  }

  onEditUser(context) async {
    ProgressDialog.spin(context, "Loading...");

    Map payload = {
      "username": usernameController.text
    };

    ApiResponse response = await userService.patchUser(user.value.id!, payload);

    if (response.success) {
      user.value.username = usernameController.text;
      usernameController.text = user.value.username!;

      await locator<LocalStorage>()
          .setUserDetails(json.encode(response.data!['user']));

      Toaster.normal("Username successfully changed!");
    }

    ProgressDialog.stop(context);

    user.refresh();
    update();
  }
}