// ignore_for_file: unused_local_variable

import '../../consts/consts.dart';
import '../../controllers/home_controllers.dart';
import '../AccountScreen/accountscreen.dart';
import '../CartScreen/cartscreen.dart';
import '../CategoriesScreen/CategoriesScreen/categories_screen.dart';
import '../HomeScreen/homescreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var homecontrollers = Get.put(Homecontrollers());
    var currentNavItems = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];

    var currentNavScreens = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 5,
            currentIndex: homecontrollers.currentNavIdex.value,
            backgroundColor: Colors.white,
            selectedItemColor: redColor,
            selectedLabelStyle: const TextStyle(
              color: redColor,
              fontFamily: semibold,
            ),
            type: BottomNavigationBarType.fixed,
            items: currentNavItems,
            onTap: (index) {
              homecontrollers.currentNavIdex.value = index;
            },
          )),
      body: Column(
        children: [
          Obx(() => Expanded(
                child: currentNavScreens
                    .elementAt(homecontrollers.currentNavIdex.value),
              )),
        ],
      ),
    );
  }
}
