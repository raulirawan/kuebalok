import 'package:flutter/material.dart';
import 'package:kuebalok/models/transaction_model.dart';
import 'package:kuebalok/pages/history_empty_page.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:kuebalok/widgets/custom_tabbar.dart';
import 'package:kuebalok/widgets/food_tile.dart';
import 'package:kuebalok/widgets/history_card.dart';
import 'package:kuebalok/widgets/success_card.dart';
import 'package:provider/provider.dart';

class OrderHistoryPage extends StatefulWidget {
  final int initialPage;

  const OrderHistoryPage({
    Key? key,
    this.initialPage = 0,
  }) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedPage = 0;
  @override
  PageController pageController = PageController(initialPage: 0);

  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    List<TransactionModel> pendingAndReject = transactionProvider.transactions
        .where(
          (element) =>
              element.status == 'PENDING' ||
              element.status == 'CANCELLED' ||
              element.status == 'ON PROGRESS',
        )
        .toList();

    List<TransactionModel> success = transactionProvider.transactions
        .where((element) => element.status == 'DELIVERED')
        .toList();

    Future<void> refresh() async {
      await transactionProvider
          .getransactions(authProvider.user.token.toString());
    }

    return transactionProvider.transactions.length == 0
        ? HistoryEmptyPage()
        : Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 117,
                    padding: EdgeInsets.only(
                      top: 30,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Riwayat Order",
                          style: blackTextStyle.copyWith(
                            fontSize: 22,
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          "Tunggu Menu Terbaik",
                          style: greyTextStyle,
                        ),
                      ],
                    ),
                  ),
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedPage = index;
                      });
                    },
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 220,
                          left: defaultMargin,
                        ),
                        child: RefreshIndicator(
                          onRefresh: refresh,
                          child: ListView(
                            children: [
                              Column(
                                children: pendingAndReject
                                    .map(
                                      (transaction) => HistoryCard(
                                        transaction: transaction,
                                      ),
                                    )
                                    .toList(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 220,
                          left: defaultMargin,
                        ),
                        child: RefreshIndicator(
                          onRefresh: refresh,
                          child: ListView(
                            children: [
                              Column(
                                children: success
                                    .map(
                                      (transaction) => SuccessCard(
                                        transaction: transaction,
                                      ),
                                    )
                                    .toList(),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 148),
                    child: CustomTabBar(
                      selectedIndex: selectedPage,
                      onTap: (index) {
                        setState(() {
                          selectedPage = index;
                        });
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
