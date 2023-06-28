import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/interceptor/models/api_response.model.dart';
import '../../app/storage/local_storage.dart';
import '../../app/strings/texts.dart';
import '../../app/widgets/progress_dialog.dart';
import '../../locator.dart';
import '../../models/user.model.dart';
import '../../services/auth.service.dart';
import '../login/login.dart';


class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {


  late TabController tabController;
  late ScrollController scrollController;

  String? token;
  var tabIndex = 0.obs;
  var pageTitle = ["Home","Menu"];
  var user = User().obs;
  var hideBottomNavigationBar = false.obs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(onTabChange);

    scrollController = ScrollController();
    scrollController.addListener(scrollControllerHandler);

    token = await locator<LocalStorage>().getToken();

    await getUser();
  }

  scrollControllerHandler () {
    hideBottomNavigationBar.value = (scrollController.offset > 20.0);
  }

  getUser() async {
    var userRawData = await locator<LocalStorage>().getUserDetails();
    user.value = User.fromJson(await json.decode(userRawData));
  }

  onTabChange() {
    tabIndex.value = tabController.index;
  }

  onLogout(context) async {
    ProgressDialog.spin(context, Texts.loggingOut);

    AuthService authService = AuthService(token);
    ApiResponse response = await authService.logout();

    if (response.success) {
      await locator<LocalStorage>().removeToken();
      await locator<LocalStorage>().removeUserDetails();

      ProgressDialog.stop(context);

      Get.offAll(() => Login());
    }
  }
}