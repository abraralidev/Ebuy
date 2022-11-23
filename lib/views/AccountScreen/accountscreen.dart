import 'package:ebuy/Widgets/background.dart';
import 'package:ebuy/consts/list.dart';

import '../../consts/consts.dart';
import 'components/detail_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.edit, color: whiteColor),
                ],
              ),
            ),
            // User Details section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'John Doe'.text.fontFamily(semibold).white.make(),
                      5.heightBox,
                      'JohnDoe@gmail.com'.text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                      ),
                      onPressed: () {},
                      child: 'Logout'.text.fontFamily(semibold).white.make())
                ],
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailCard('In your Cart', '0', context.screenWidth / 3.5),
                detailCard('In your Wishlist', '5', context.screenWidth / 3.5),
                detailCard('Your Orders', '7', context.screenWidth / 3.5),
              ],
            ),
            10.heightBox,
            // buttons section
            ListView.separated(
              shrinkWrap: true,
              itemCount: profilebutttonlist.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: lightGrey,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    profilebuttoniscons[index],
                    width: 20,
                  ),
                  title: profilebutttonlist[index]
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                );
              },
            )
                .box
                .white
                .rounded
                .margin(const EdgeInsets.all(12))
                .padding(const EdgeInsets.symmetric(horizontal: 10))
                .shadowSm
                .make()
                .box
                .color(redColor)
                .make(),
          ],
        ),
      ),
    ));
  }
}
