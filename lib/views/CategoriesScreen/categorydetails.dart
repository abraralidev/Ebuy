import 'package:ebuy/Widgets/background.dart';

import '../../consts/consts.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
        appBar: AppBar(
      title: title!.text.fontFamily(bold).white.make(),
    )));
  }
}
