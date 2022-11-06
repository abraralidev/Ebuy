import 'package:ebuy/Components/featuredbotton.dart';
import 'package:ebuy/consts/list.dart';

import '../../Widgets/home_bottons.dart';
import '../../consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: context.screenWidth,
      height: context.screenHeight,
      color: lightGrey,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: search,
                  hintStyle: TextStyle(color: textfeildgrey),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // -------swiper brands---------------
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sliderslist.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderslist[index],
                          fit: BoxFit.cover,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    //--------------------- deals bottons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeBottons(
                          context.screenWidth / 2.5,
                          context.screenHeight * 0.15,
                          index == 0 ? todaydeals : flashsale,
                          index == 0 ? icTodaysDeal : icFlashDeal,
                          () {},
                        ),
                      ),
                    ),
                    10.heightBox,
                    //--------------------------- 2nd Sliderr
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sceondsliderslist.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sceondsliderslist[index],
                          fit: BoxFit.cover,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    //--------------------- deals bottons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => homeBottons(
                          context.screenWidth / 3.6,
                          context.screenHeight * 0.15,
                          index == 0
                              ? topcategory
                              : index == 1
                                  ? topsellers
                                  : brands,
                          index == 0
                              ? icTopCategories
                              : index == 1
                                  ? icTopSeller
                                  : icBrands,
                          () {},
                        ),
                      ),
                    ),
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featuredcategory.text
                            .color(darkFontGrey)
                            .size(18)
                            .fontFamily(bold)
                            .make()),
                    20.heightBox,
                    //--------------------------- featured category
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    children: [
                                      featuredButton(featuredImagelist[index],
                                          featuredcategorytitle[index]),
                                      10.heightBox,
                                      featuredButton(featuredImagelist2[index],
                                          featuredcategorytitle2[index]),
                                    ],
                                  ))),
                    ),
                    20.heightBox,
                    //--------------------------- featured Products
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
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
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 8))
                                    .padding(const EdgeInsets.all(8))
                                    .make(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ----------------3rd Swiper
                    20.heightBox,
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      itemCount: sceondsliderslist.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sceondsliderslist[index],
                          fit: BoxFit.cover,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    20.heightBox,
                    //--------------------------- All Products
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 300,
                              crossAxisCount: 2),
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
                            .padding(const EdgeInsets.all(12))
                            .make();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
