import 'package:flutter/material.dart';
import 'package:kuebalok/models/transaction_model.dart';
import 'package:kuebalok/pages/driver/main_page_driver.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class DetailOrderPage extends StatefulWidget {
  final TransactionModel transaction;
  const DetailOrderPage({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
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
                            "Order",
                            style: blackTextStyle.copyWith(
                              fontSize: 22,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            "berikut rincinan pesanan",
                            style: greyTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
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
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Detail Transaksi",
                            style: blackTextStyle,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Invoice",
                                  style: greyTextStyle,
                                ),
                                Text(
                                  "${widget.transaction.invoice}",
                                  style: blackTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                              bottom: 43,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Harga",
                                  style: greyTextStyle,
                                ),
                                Text(
                                  "${widget.transaction.totalPrice}",
                                  style: greenTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Kirim Ke",
                            style: blackTextStyle,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nama",
                                  style: greyTextStyle,
                                ),
                                Text(
                                  "${widget.transaction.user!.name}",
                                  style: blackTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nomor HP",
                                  style: greyTextStyle,
                                ),
                                Text(
                                  "${widget.transaction.user!.phoneNumber}",
                                  style: blackTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                              bottom: 43,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Alamat",
                                  style: greyTextStyle,
                                ),
                                Text(
                                  "${widget.transaction.user!.address}",
                                  style: blackTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  color: Colors.white,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });

                              if (await transactionProvider.updateTransaction(
                                  transactionId: widget.transaction.id,
                                  token: authProvider.user.token)) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPageDriver(
                                              initialPage: 0,
                                            )),
                                    (route) => false);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: alertColor,
                                    content: Text(
                                      "Gagal Selesaikan Pesanan!",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Text(
                              "Pesanan Selesai",
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
