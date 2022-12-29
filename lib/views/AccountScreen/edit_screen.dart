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
       data['imageurl']==''&&   controller.profileImagePath.isEmpty
              ? Image.asset(
                  imgProfile,
                  width: 150,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make()
              :
              data['imageurl']!=''&&   controller.profileImagePath.isEmpty?
                Image.network(data['imageurl'],width: 150,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
               :Image.file(
                  File(controller.profileImagePath.value),
                  width: 150,
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
          Customtextfeild(
              false, passwordhint, password, controller.passwordcontroller),
          20.heightBox,
          controller.isloading.value
              ? const Center(
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor)),
                )
              : SizedBox(
                  width: context.screenWidth - 40,
                  child: CustomButton(() async {
                    controller.isloading(true);
                    await controller.uploadImage();
                    await controller.updateProfile(
                        controller.namecontroller.text,
                        controller.passwordcontroller.text,
                        controller.profileImagePath.value);
                    VxToast.show(context, msg: 'Profile Updated');
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
