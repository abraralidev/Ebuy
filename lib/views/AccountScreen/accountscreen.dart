// ignore_for_file: use_build_context_synchronously, must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy/Services/firestore_services.dart';
import 'package:ebuy/Widgets/background.dart';
import 'package:ebuy/consts/list.dart';
import 'package:ebuy/controllers/auth_controller.dart';
import 'package:ebuy/views/AccountScreen/edit_screen.dart';
import '../../consts/consts.dart';
import '../../controllers/profile_controller.dart';
import '../Auth/loginscreen.dart';
import 'components/detail_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Background(Scaffold(
      body: StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ));
          } else {
            var data = snapshot.data!.docs[0];
            return SafeArea(
              child: Column(
                children: [
                  // Edit Profile Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          color: whiteColor,
                          icon: const Icon(
                            Icons.edit,
                          ),
                          onPressed: () {
                            controller.namecontroller.text = data['name'];
                            // controller.passwordcontroller.text =
                            //     data['password'];

                            Get.to(() => EditProfileScreen(
                                  data: data,
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                  // User Details section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        data['imageurl'] == ''
                            ? Image.asset(
                                imgProfile,
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imageurl'],
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                        Image.asset(
                          imgProfile,
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            '${data['name']}'
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            5.heightBox,
                            '${data['email']}'.text.white.make(),
                          ],
                        )),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signOutMethod(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child:
                                'Logout'.text.fontFamily(semibold).white.make())
                      ],
                    ),
                  ),
                  2.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailCard('In your Cart', '${data['cart_count']}',
                          context.screenWidth / 3.5),
                      detailCard(
                          'In your Wishlist',
                          '${data['wishlist_count']}',
                          context.screenWidth / 3.5),
                      detailCard('Your Orders', '${data['order_count']}',
                          context.screenWidth / 3.5),
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
            );
          }
        },
      ),
    ));
  }
}
