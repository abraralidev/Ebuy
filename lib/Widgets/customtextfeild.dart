// ignore_for_file: non_constant_identifier_names

import 'package:ebuy/consts/consts.dart';

Widget Customtextfeild(bool isPass, String? hint, String? title, Controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: Controller,
        decoration:  InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: textfieldGrey,
            fontFamily: semibold,
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    ],
  );
}
