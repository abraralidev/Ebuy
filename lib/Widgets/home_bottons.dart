import 'package:ebuy/consts/consts.dart';

Widget homeBottons(double width, double height, String title, String? icon,
    Function() onPress) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon!, width: 26),
      10.heightBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.rounded.white.size(width, height).outerShadow.make();
}
