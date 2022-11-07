import 'package:ebuy/consts/consts.dart';

Widget itemButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      'Add to Cart'
          .text
          .color(whiteColor)
          .fontFamily(semibold)
          .makeCentered()
          .box
          .roundedSM
          .color(redColor)
          .size(120, 60)
          .make(),
      10.widthBox,
      'Buy Now'
          .text
          .color(whiteColor)
          .fontFamily(semibold)
          .makeCentered()
          .box
          .roundedSM
          .color(redColor)
          .size(120, 60)
          .make(),
    ],
  );
}
