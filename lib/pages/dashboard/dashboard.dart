import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../app/config/app_colors.dart';
import '../home/home.dart';
import '../menu/menu.dart';
import '../new_list/newlist.dart';
import '../notifications/notifications.dart';
import '../shared/widgets/containers/app_bar_logo_title.dart';
import '../shared/widgets/containers/hidden_container.dart';
import 'dashboard.controller.dart';

class Dashboard extends StatelessWidget {

  Dashboard({Key? key}) : super(key: key);
  final dc = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double tabSize = (size.width - (size.width / 4)) / 4;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: NestedScrollView(
              controller: dc.scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    pinned: true,
                    floating: true,
                    snap: false,
                    automaticallyImplyLeading: false,
                    elevation: 1,
                    forceElevated: true,
                    title: Obx(() => AppBarLogoTitle(
                      text: "List",
                      subText: dc.pageTitle[dc.tabIndex.value],
                    )),
                    actions: [
                      Stack(
                        children: [
                          Align(
                            child: IconButton(
                              icon: const Icon(CupertinoIcons.bell, color: AppColors.primary),
                              onPressed: () {
                                Navigator.push(context, PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Notifications()
                                ));
                              },
                            ),
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle
                              ),
                              child: const Text("10",
                                style: TextStyle(
                                    fontSize: 10
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ];
              },
              body: Obx(() => TabBarView(
                controller: dc.tabController,
                children: [
                  const Home(),
                  Menu(
                    user: dc.user.value,
                    onLogout: () async {
                      await dc.onLogout(context);
                    },
                  )
                ],
              ))
          ),
          bottomNavigationBar: Obx(() => dc.hideBottomNavigationBar.value ? const HiddenContainer() : BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    color: Colors.transparent,
                    width: tabSize,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        dc.tabController.animateTo(0);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(dc.tabIndex.value == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 5),
                          const Text("Home",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 11
                            ),
                          )
                        ],
                      ),
                    )
                ),
                // Container(
                //     color: Colors.transparent,
                //     width: tabSize,
                //     child: InkWell(
                //       splashFactory: NoSplash.splashFactory,
                //       splashColor: Colors.transparent,
                //       highlightColor: Colors.transparent,
                //       onTap: () {
                //         dc.tabController.animateTo(1);
                //       },
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(dc.tabIndex.value == 1 ? CupertinoIcons.doc_on_doc_fill : CupertinoIcons.doc_on_doc,
                //             size: 18,
                //             color: AppColors.primary,
                //           ),
                //           const SizedBox(height: 5),
                //           const Text("Billings",
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //                 color: AppColors.primary,
                //                 fontSize: 11
                //             ),
                //           )
                //         ],
                //       ),
                //     )
                // ),
                // const Expanded(
                //   child: HiddenContainer(),
                // ),
                // Container(
                //     color: Colors.transparent,
                //     width: tabSize,
                //     child: InkWell(
                //       splashFactory: NoSplash.splashFactory,
                //       splashColor: Colors.transparent,
                //       highlightColor: Colors.transparent,
                //       onTap: () {
                //         dc.tabController.animateTo(2);
                //       },
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(dc.tabIndex.value == 2 ? CupertinoIcons.briefcase_fill : CupertinoIcons.briefcase,
                //             size: 18,
                //             color: AppColors.primary,
                //           ),
                //           const SizedBox(height: 5),
                //           const Text("Accounts",
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //                 color: AppColors.primary,
                //                 fontSize: 11
                //             ),
                //           )
                //         ],
                //       ),
                //     )
                // ),
                Container(
                    color: Colors.transparent,
                    width: tabSize,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        dc.tabController.animateTo(1);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(dc.tabIndex.value == 1 ? CupertinoIcons.person_crop_circle_fill : CupertinoIcons.person_crop_circle,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 5),
                          const Text("Menu",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 11
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          )),
          // floatingActionButton: Obx(() => Visibility(
          //   visible: !dc.hideBottomNavigationBar.value,
          //   child: FloatingActionButton(
          //       onPressed: () {
          //
          //       },
          //       backgroundColor: AppColors.primary,
          //       child: const Icon(CupertinoIcons.add,
          //           color: Colors.white
          //       )
          //   ),
          // )),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        )
    );
  }

}