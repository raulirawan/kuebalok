import 'package:flutter/material.dart';
import 'package:kuebalok/pages/cart_page.dart';
import 'package:kuebalok/pages/food_page.dart';
import 'package:kuebalok/pages/order_history_page.dart';
import 'package:kuebalok/pages/profile_page.dart';
import 'package:kuebalok/theme.dart';
import 'package:kuebalok/widgets/custom_bottom_navbar.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  const MainPage({
    Key? key,
    this.initialPage = 0,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: bgGrey,
          )),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                  child: CartPage(),
                ),
                Center(
                  child: OrderHistoryPage(),
                ),
                Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(
                  () {
                    selectedPage = index;
                  },
                );
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
