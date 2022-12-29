import 'package:ebuy/Widgets/background.dart';

import 'package:ebuy/views/home/home.dart';

import '../../Widgets/applogo.dart';
import '../../Widgets/custombutton.dart';
import '../../Widgets/customtextfeild.dart';
import '../../consts/consts.dart';
import '../../controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? ischeck = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _retypepasswordController =
      TextEditingController();
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox, AppLogo(),
          10.heightBox,
          // Add your widgets Text
          "Join the $appname".text.fontFamily(bold).white.size(18).make(),
          15.heightBox,
          // Add your widgets Box
          Obx(
           ()=> Column(
              children: [
                Customtextfeild(
                  false,
                  namehint,
                  name,
                  _nameController,
                ),
                10.heightBox,
                Customtextfeild(
                  false,
                  emailhint,
                  email,
                  _emailController,
                ),
                10.heightBox,
                Customtextfeild(
                  true,
                  passwordhint,
                  password,
                  _passwordController,
                ),
                10.heightBox,
                Customtextfeild(
                  true,
                  passwordhint,
                  retypepassword,
                  _retypepasswordController,
                ),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(redColor),
                      value: ischeck,
                      checkColor: redColor,
                      onChanged: (value) {
                        setState(() {
                          ischeck = value;
                        });
                      },
                    ),
                    5.widthBox,
                    Expanded(
                      child: RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "I agree to the ",
                              style:
                                  TextStyle(color: fontGrey, fontFamily: regular),
                              children: [
                                TextSpan(
                                  text: termsofuse,
                                  style: TextStyle(
                                      color: redColor,
                                      fontFamily: regular,
                                      fontSize: 16),
                                ),
                                TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                      color: fontGrey,
                                      fontFamily: regular,
                                      fontSize: 16),
                                ),
                                TextSpan(
                                  text: privacypolicy,
                                  style: TextStyle(
                                      color: redColor,
                                      fontFamily: regular,
                                      fontSize: 16),
                                ),
                              ])),
                    )
                  ],
                ),
                10.heightBox,
                // Add your widgets CustomButton
                                 controller.isloading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          ),
                        )
                      :  CustomButton(
                  () async {

                    if (ischeck != false) {
                      controller.isloading(true);
                      try {
                        await controller
                            .signUpMethod(
                                _emailController.text, _passwordController.text,BuildContext)
                            .then((value) => controller.storeUserData(
                                _nameController.text,
                                _passwordController.text,
                                _emailController.text))
                            .then((value) {
                          VxToast.show(context, msg: SignUpsccuess);
                          Get.offAll(const Home());
                        });
                      } catch (e) {
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                      controller.isloading(false);
                      }

                    }
                  },
                  signup,
                  ischeck == true ? redColor : fontGrey,
                  Colors.white,
                ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                // Add your widgets LoginButton
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: alreadyaccount,
                      style: TextStyle(
                          color: fontGrey, fontFamily: semibold, fontSize: 16)),
                  TextSpan(
                      text: " $login",
                      style: TextStyle(
                          color: redColor, fontFamily: semibold, fontSize: 16))
                ])).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .shadowSm
                .width(context.screenWidth - 70)
                .make(),
          ),
        ],
      )),
    ));
  }
}
