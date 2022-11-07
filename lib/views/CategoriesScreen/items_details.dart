import 'package:ebuy/Widgets/itembuttons.dart';

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
                            child: 'Color:'
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
                            child: 'Color:'
                                .text
                                // .fontFamily(semibold)
                                .color(textfeildgrey)
                                // .size(16)
                                .make(),
                          ),
                          10.widthBox,
                          Row(children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(''),
                            ),
                          ])
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),
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
