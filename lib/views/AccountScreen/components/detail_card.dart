import 'package:ebuy/consts/consts.dart';

Widget detailCard(
 
  String ?title,
  String ?count,
  width
)

 {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).size(18).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .roundedSM
      .width(width)
      .height(80)
      .padding(const EdgeInsets.all(4))
      .make();
}
