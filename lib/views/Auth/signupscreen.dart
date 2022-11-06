import 'package:ebuy/Widgets/background.dart';

import '../../Widgets/applogo.dart';
import '../../Widgets/custombutton.dart';
import '../../Widgets/customtextfeild.dart';
import '../../consts/consts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? ischeck = false;
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
          "Join the $appname".text.fontFamily(bold).white.size(18).make(),
          15.heightBox,
          // Add your widgets Box
          Column(
            children: [
              Customtextfeild(
                namehint,
                name,
                _emailController,
              ),
              10.heightBox,
              Customtextfeild(
                emailhint,
                email,
                _passwordController,
              ),
              10.heightBox,
              Customtextfeild(
                passwordhint,
                password,
                _emailController,
              ),
              10.heightBox,
              Customtextfeild(
                passwordhint,
                retypepassword,
                _passwordController,
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
              CustomButton(
                () {},
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
        ],
      )),
    ));
  }
}
