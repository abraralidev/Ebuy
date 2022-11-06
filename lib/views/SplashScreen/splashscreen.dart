
import 'package:ebuy/consts/consts.dart';
import '../../Widgets/applogo.dart';
import '../Auth/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changescreen();
  }

  changescreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: redColor,
        body: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  icSplashBg,
                  fit: BoxFit.cover,
                  height: 300,
                  width: 300,
                ),
              ),
              20.heightBox,
              AppLogo(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              5.heightBox,
              appversion.text.fontFamily(regular).white.make(),
              const Spacer(),
              credits.text.fontFamily(semibold).white.make(),
              30.heightBox,
            ],
          ),
        ));
  }
}
