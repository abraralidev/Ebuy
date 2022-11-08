import 'package:ebuy/Widgets/itembuttons.dart';
import 'package:ebuy/consts/list.dart';

import '../../consts/consts.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key, required this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.fontFamily(bold).black.make(),
        leading: const Icon(Icons.arrow_back).onTap(() {
          Get.back();
        }),
        iconTheme: const IconThemeData(color: darkFontGrey),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.share,
              ),
              onPressed: () {}),
          10.widthBox,
          IconButton(
              icon: const Icon(
                Icons.favorite_outline,
              ),
              onPressed: () {}),
          10.widthBox,
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      itemCount: 3,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  title!.text
                      .size(18)
                      .color(darkFontGrey)
                      .fontFamily(bold)
                      .make(),
                  10.heightBox,
                  // Rating
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfeildgrey,
                    selectionColor: golden,
                    size: 25,
                    count: 5,
                    stepInt: true,
                  ),
                  10.heightBox,
                  '\$200.00'
                      .text
                      .color(redColor)
                      .fontFamily(bold)
                      .size(18)
                      .make(),
                  10.heightBox,

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Seller'.text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            'In House Brands'
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .size(16)
                                .make()
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      ),
                    ],
                  )
                      .box
                      .height(60)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .color(textfeildgrey)
                      .make(),
                  20.heightBox,
                  // Color section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Color: '
                                .text
                                // .fontFamily(semibold)
                                .color(textfeildgrey)
                                // .size(16)
                                .make(),
                          ),
                          10.widthBox,
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 6))
                                    .roundedFull
                                    .make()),
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
//----------------------Quantity row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Quantity: '
                                .text
                                // .fontFamily(semibold)
                                .color(textfeildgrey)
                                // .size(16)
                                .make(),
                          ),
                          10.widthBox,
                          Row(children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                            ),
                            '0'
                                .text
                                .size(16)
                                .color(darkFontGrey)
                                .fontFamily(bold)
                                .make(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                            10.widthBox,
                            '(0 available)'
                                .text
                                .size(16)
                                .color(textfeildgrey)
                                .make(),
                          ])
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
//--------------------------Total Row-----------------------------
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: 'Total: '
                                .text
                                // .fontFamily(semibold)
                                .color(textfeildgrey)
                                // .size(16)
                                .make(),
                          ),
                          '\$0.00'
                              .text
                              .color(redColor)
                              .size(16)
                              .fontFamily(bold)
                              .make()
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),
// --------------------Description Section here
                  20.heightBox,
                  'Description'
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  20.heightBox,

                  'this is the description of the product, this is the description of the product, this is the description of the product, this is the description of the product, this is the description of the product, this is the description of the product, this is the description of the product,'
                      .text
                      .color(darkFontGrey)
                      // .fontFamily(semibold)
                      .make(),
                  20.heightBox,

                  Column(
                    // shrinkWrap: true,
                    children: List.generate(
                        5,
                        (index) => ListTile(
                              title: itemDetailPageText[index]
                                  .text
                                  .color(darkFontGrey)
                                  // .fontFamily(semibold)
                                  .make(),
                              trailing: const Icon(Icons.arrow_forward),
                            )
                                .box
                                .padding(const EdgeInsets.all(8))
                                .white
                                .shadowSm
                                .make()),
                  ),
                  20.heightBox,
                  'Product may you also like'.text.fontFamily(bold).make(),
                  20.heightBox,
   //---------------------Copy of widgets from home screen---------------------------------               
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        6,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            10.heightBox,
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
                          ],
                        )
                            .box
                            .white
                            .roundedSM
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .padding(const EdgeInsets.all(8))
                            .make(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
          itemButton(),
          20.heightBox,
        ],
      ),
    );
  }
}
