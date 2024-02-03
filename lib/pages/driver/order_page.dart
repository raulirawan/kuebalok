import 'package:flutter/material.dart';
import 'package:kuebalok/models/transaction_model.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:kuebalok/widgets/order_card.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    List<TransactionModel> transactionOnProgress = transactionProvider
        .transactions
        .where((element) => element.status == 'ON PROGRESS')
        .toList();
    Future<void> refresh() async {
      await transactionProvider
          .getTransactionOnProgress(authProvider.user.token.toString());
    }

    @override
    void initState() async {
      super.initState();
      await transactionProvider
          .getTransactionOnProgress(authProvider.user.token.toString());
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    // header
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
                            "Halo, ${authProvider.user.name}",
                            style: blackTextStyle.copyWith(
                              fontSize: 22,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            "Ada yang harus di antar nih!",
                            style: greyTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    // makanan
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        top: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaksi",
                            style: blackTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Column(
                                children: transactionOnProgress
                                    .map(
                                      (transaction) => OrderCard(
                                        transaction: transaction,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Minuman
                    SizedBox(
                      height: 16,
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
