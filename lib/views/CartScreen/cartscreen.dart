// ignore_for_file: use_build_context_synchronously

import 'package:ebuy/controllers/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../consts/consts.dart';
import '../Auth/loginscreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iccartsvg, height: 200, width: 200),
            20.heightBox,
                                    OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signOutMethod(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child:
                                'Logout'.text.fontFamily(semibold).white.make())
          ],
        ),
      ),
    );
  }
}
