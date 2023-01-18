// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:ebuy/Widgets/background.dart';
import 'package:ebuy/Widgets/custombutton.dart';
import 'package:ebuy/Widgets/customtextfeild.dart';

import '../../consts/consts.dart';
import '../../controllers/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    // controller.namecontroller.text = data['name'];
    // controller.passwordcontroller.text = data['password'];
    return Background(Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Obx(
        () => Column(mainAxisSize: MainAxisSize.min, children: [
          data['imageurl'] == '' && controller.profileImagePath.isEmpty
              ? Image.asset(
                  imgProfile,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make()
              : data['imageurl'] != '' && controller.profileImagePath.isEmpty
                  ? Image.network(
                      data['imageurl'],
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profileImagePath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
          10.heightBox,
          CustomButton(() {
            try {
              controller.changeImage(context);
            } catch (e) {
              print(e);
            }
          }, 'Change', redColor, whiteColor),
          const Divider(),
          20.heightBox,
          Customtextfeild(false, namehint, name, controller.namecontroller),
          10.heightBox,
          Customtextfeild(
              true, passwordhint, oldpass, controller.oldpasswordcontroller),
          10.heightBox,
          Customtextfeild(
              true, passwordhint, newpass, controller.newpasswordcontroller),
          20.heightBox,
          controller.isloading.value
              ? const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor)),
                )
              : SizedBox(
                  width: context.screenWidth - 40,
                  child: CustomButton(() async {
                    controller.isloading(true);

                    //condition if image not selected
                    if (controller.profileImagePath.isNotEmpty) {
                      await controller.uploadImage();
                    } else {
                      controller.profileImagePath.value = data['imageurl'];
                    }

//condition if old password matches database password
                    if (controller.oldpasswordcontroller.text ==
                        data['password']) {
                      await controller.changeAuthPassword(
                          currentUser!.email,
                           controller.oldpasswordcontroller.text,
                          controller.newpasswordcontroller.text,
                          context);

                      await controller.updateProfile(
                          controller.namecontroller.text,
                          controller.newpasswordcontroller.text,
                          controller.profileImagePath.value);
                      VxToast.show(context, msg: 'Profile Updated');
                    } else {
                      VxToast.show(context, msg: 'Old Password is incorrect');

                      controller.isloading(false);
                    }
                  }, 'Save', redColor, whiteColor)),
        ])
            .box
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .white
            .rounded
            .make(),
      ),
    ));
  }
}
