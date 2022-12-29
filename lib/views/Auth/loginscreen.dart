// ignore_for_file: unused_field

import 'package:ebuy/consts/consts.dart';
import 'package:ebuy/consts/list.dart';
import 'package:ebuy/controllers/auth_controller.dart';
import 'package:ebuy/views/Auth/signupscreen.dart';
import 'package:ebuy/views/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Widgets/applogo.dart';
import '../../Widgets/background.dart';
import '../../Widgets/custombutton.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(AuthController());
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
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
          Obx(
            () => Form(
              key: _formKey,
              child: Column(
                children: [
            //================================================================================================
            
                  // Customtextfeild(
                  //   false,
                  //   emailhint,
                  //   email,
                  //  emailcontroller,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      email.text
                          .color(redColor)
                          .fontFamily(semibold)
                          .size(16)
                          .make(),
                      5.heightBox,
                      TextFormField(
                        autofocus: false,
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Email");
                          }
                          String pattern = r'\w+@\w+\.\w+';
                          if (!RegExp(pattern).hasMatch(value)) {
                            return 'Invalid Email format';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailcontroller.text = value!;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: emailhint,
                          hintStyle: TextStyle(
                            color: textfieldGrey,
                            fontFamily: semibold,
                          ),
                          isDense: true,
                          fillColor: lightGrey,
                          filled: true,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: redColor),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
            //================================================================================================
            
                  10.heightBox,
            //================================================================================================
                  // Customtextfeild(
                  //   true,
                  //   passwordhint,
                  //   password,
                  //   passwordcontroller,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      password.text
                          .color(redColor)
                          .fontFamily(semibold)
                          .size(16)
                          .make(),
                      5.heightBox,
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        controller: passwordcontroller,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Please Enter Password");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Please Enter Valid Password(Min 6 character)");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          passwordcontroller.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: passwordhint,
                          hintStyle: TextStyle(
                            color: textfieldGrey,
                            fontFamily: semibold,
                          ),
                          isDense: true,
                          fillColor: lightGrey,
                          filled: true,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: redColor),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
            //================================================================================================
            
                  TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: forgetpassword.text.fontFamily(semibold).make(),
                      )),
                  10.heightBox,
                  // Add your widgets CustomButton
                  controller.isloading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          ),
                        )
                      : CustomButton(
                          () {
                            signIn(emailcontroller.text, passwordcontroller.text);
                            // controller.isloading(true);
                            // await controller.loginMethod(context).then((value) {
                            //   if (value != null) {
                            //     VxToast.show(context, msg: loginSccuess);
                            //     Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => const Home()));
                            //   }else{
                            //     controller.isloading(false);
                            //   }
                            // });
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
            ),
          ),
        ],
      )),
    ));
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                VxToast.show(context, msg: loginSccuess),
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                ),
              })
          .catchError((e) {
        VxToast.show(context, msg: e!.message);
      });
    }
  }
}
