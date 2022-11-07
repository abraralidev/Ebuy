import 'package:ebuy/Widgets/background.dart';
import 'package:ebuy/views/CategoriesScreen/items_details.dart';

import '../../consts/consts.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => 'Baby Clothes'
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .makeCentered()
                          .box
                          .roundedSM
                          .white
                          .size(100, 60)
                          .margin(const EdgeInsets.symmetric(horizontal: 5))
                          .make()),
                ),
              ),
              10.heightBox,
              Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 300,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                          const Spacer(),
                          'Laptop 4 / 128'
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          10.heightBox,
                          '\$600'
                              .text
                              .fontFamily(bold)
                              .size(16)
                              .color(redColor)
                              .make(),
                          20.heightBox,
                        ],
                      )
                          .box
                          .white
                          .rounded
                          .shadowSm
                          .padding(const EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                        Get.to(() => const ItemsDetails(
                              title: 'Demo',
                            ));
                      });
                    }),
              )
            ],
          )),
    ));
  }
}
