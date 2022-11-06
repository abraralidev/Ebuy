// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:ebuy/consts/consts.dart';

Widget CustomButton(
    Function() onPress, String title, Color color, Color textcolor) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color, padding: const EdgeInsets.all(12)),
      onPressed: onPress,
      child: title.text.color(textcolor).fontFamily(bold).make());
}
