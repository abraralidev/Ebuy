import 'package:ebuy/consts/consts.dart';

Widget featuredButton(String image, String title) {
  return Row(
    children: [
      Image.asset(image, width: 50, fit: BoxFit.fill),
      10.widthBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 5))
      .white
      .roundedSM
      .padding(const EdgeInsets.all(8))
      .outerShadowSm
      .make();
}
