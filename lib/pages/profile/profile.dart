import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/profile/profile.controller.dart';
import '../../app/config/app_colors.dart';
import '../../app/helpers/image_checker.dart';
import '../shared/widgets/buttons/app_back_button.dart';
import '../shared/widgets/containers/header_title.dart';
import '../shared/widgets/containers/user_avatar.dart';
import '../shared/widgets/containers/value_text.dart';
import '../shared/widgets/dialogs/edit_dialog.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final pc = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const AppBackButton(),
        title: const Text("Profile",
          style: TextStyle(
              color: AppColors.primary
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: UserAvatar(
                    profilePicture: ImageChecker.checkImage(pc.user.value.picture),
                    width: 130,
                    height: 130,
                  )
              )
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                const HeaderTitle(
                  icon: CupertinoIcons.person_crop_circle_fill,
                  title: "Personal Information",
                  marginTop: 7,
                  marginBottom: 7,
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                  ),
                ),
                Obx(() => ValueText(
                  keyText: "Username",
                  value: pc.user.value.username!,
                  isEditable: true,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  onEdit: () async {
                    bool? proceed = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditDialog(
                              title: "Edit Username",
                              controller: pc.usernameController,
                              label: "Username",
                              isLoading: pc.isLoading.value
                          );
                        }
                    );

                    if (proceed != null && proceed == true) {
                      // ignore: use_build_context_synchronously
                      pc.onEditUser(context);
                    }
                  },
                )),
                ValueText(
                  keyText: "First Name",
                  value: pc.user.value.firstName!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Middle Name",
                  value: pc.user.value.middleName!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Last Name",
                  value: pc.user.value.firstName!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Email Address",
                  value: pc.user.value.email!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Phone Number",
                  value: pc.user.value.phone!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                const HeaderTitle(
                    icon: CupertinoIcons.map_fill,
                    title: "Address Information",
                    marginTop: 7,
                    marginBottom: 7,
                    backgroundColor: AppColors.primary,
                    textColor: Colors.white,
                    iconColor: Colors.white
                ),
                ValueText(
                  keyText: "Region",
                  value: pc.user.value.region!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Province",
                  value: pc.user.value.province!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Zip Code",
                  value: pc.user.value.zipCode!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "City/Municipality",
                  value: pc.user.value.city!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Barangay",
                  value: pc.user.value.barangay!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Street",
                  value: pc.user.value.street!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
                ValueText(
                  keyText: "Address Line",
                  value: pc.user.value.completeAddress!,
                  isEditable: false,
                  isColored: false,
                  verticalPadding: 10,
                  horizontalPadding: 20,
                  keyWidth: 4,
                  hasEdit: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
