// ignore_for_file: non_constant_identifier_names

import 'package:ebuy/consts/consts.dart';

Widget Background(Widget childcard) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.fill,
      ),
    ),
    child: childcard,
  );
}
