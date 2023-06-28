import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../app/interceptor/models/api_response.model.dart';
import '../../app/storage/local_storage.dart';
import '../../app/widgets/progress_dialog.dart';
import '../../app/widgets/toaster.dart';
import '../../locator.dart';
import '../../services/user.service.dart';

class ChangePasswordController extends GetxController {

  String? token;

  late UserService userService;
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() async {
    token = await locator<LocalStorage>().getToken();
    userService = UserService(token);
    super.onInit();
  }


  onChangePassword(context) async {
    ProgressDialog.spin(context, "Loading...");

    Map payload = {
      "password": passwordController.text,
      "new_password": newPasswordController.text,
      "confirm_password": confirmPasswordController.text
    };

    ApiResponse response = await userService.changePassword(payload);

    if (response.success) {
      passwordController.text = "";
      newPasswordController.text = "";
      confirmPasswordController.text = "";

      Toaster.normal("Password successfully changed!");
    }

    ProgressDialog.stop(context);
  }
}