// ignore_for_file: unused_field

import 'package:ebuy/consts/consts.dart';
import 'package:ebuy/consts/list.dart';
import 'package:ebuy/views/Auth/signupscreen.dart';
import 'package:ebuy/views/home/home.dart';
import '../../Widgets/applogo.dart';
import '../../Widgets/background.dart';
import '../../Widgets/custombutton.dart';
import '../../Widgets/customtextfeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
          "LogIn to $appname".text.fontFamily(bold).white.size(18).make(),
          15.heightBox,
          // Add your widgets Box
          Column(
            children: [
              Customtextfeild(
                emailhint,
                email,
                _emailController,
              ),
              10.heightBox,
              Customtextfeild(
                passwordhint,
                password,
                _passwordController,
              ),
              TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: forgetpassword.text.fontFamily(semibold).make(),
                  )),
              10.heightBox,
              // Add your widgets CustomButton
              CustomButton(
                () {
                  Get.to(() => const Home());
                },
                login,
                redColor,
                Colors.white,
              ).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              // Add your widgets Text
              dontaccount.text.fontFamily(semibold).color(fontGrey).make(),
              10.heightBox,
              // Add your widgets CustomButton
              CustomButton(
                () {
                  Get.to(() => const SignUpScreen());
                },
                signup,
                lightGolden,
                redColor,
              ).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              // Add your widgets Text
              loginwith.text.fontFamily(semibold).make(),
              10.heightBox,
              // Add your widgets Row
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: lightGrey,
                              child: Image.asset(
                                socialIcons[index],
                                width: 25,
                              ),
                            ),
                          )))
            ],
          )
              .box
              .white
              .rounded
              .padding(const EdgeInsets.all(16))
              .shadowSm
              .width(context.screenWidth - 70)
              .make(),
        ],
      )),
    ));
  }
}
