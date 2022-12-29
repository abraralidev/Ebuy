
import 'package:ebuy/consts/consts.dart';
import 'package:ebuy/views/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    await Future.delayed(const Duration(seconds: 2), () async{
      if (FirebaseAuth.instance.currentUser != null) {
        Route route = MaterialPageRoute(builder: (_) => const Home());
        Navigator.pushReplacement(context, route);
      } else {
        Route route = MaterialPageRoute(builder: (_) => const LoginScreen());
        Navigator.pushReplacement(context, route);
      }
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
