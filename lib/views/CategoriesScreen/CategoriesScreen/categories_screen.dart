import 'package:ebuy/Widgets/background.dart';
import 'package:ebuy/consts/list.dart';

import '../../../consts/consts.dart';
import '../categorydetails.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  mainAxisExtent: 200),
              itemBuilder: ((context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      categorylistImages[index],
                      height: 150,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    categorylist[index]
                        .text
                        .align(TextAlign.center)
                        .fontFamily(bold)
                        .make()
                  ],
                )
                    .box
                    .rounded
                    .white
                    .clip(Clip.antiAlias)
                    .outerShadowSm
                    .white
                    .make()
                    .onTap(() {
                  Get.to(() => CategoryDetail(
                        title: categorylist[index],
                      )); 
                });
              })),
        )));
  }
}
