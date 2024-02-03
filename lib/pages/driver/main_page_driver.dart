import 'package:flutter/material.dart';
import 'package:kuebalok/pages/driver/order_page.dart';
import 'package:kuebalok/pages/driver/profile_page_driver.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:kuebalok/widgets/custom_bottom_navbar_driver.dart';
import 'package:provider/provider.dart';

class MainPageDriver extends StatefulWidget {
  final int initialPage;
  const MainPageDriver({
    Key? key,
    this.initialPage = 0,
  }) : super(key: key);

  @override
  _MainPageDriverState createState() => _MainPageDriverState();
}

class _MainPageDriverState extends State<MainPageDriver> {
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    Future<void> refresh() async {
      await transactionProvider
          .getTransactionOnProgress(authProvider.user.token.toString());
    }

    return RefreshIndicator(
      onRefresh: refresh,
      child: Scaffold(
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
                    child: OrderPage(),
                  ),
                  Center(
                    child: ProfilePageDriver(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavbarDriver(
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
      ),
    );
  }
}
