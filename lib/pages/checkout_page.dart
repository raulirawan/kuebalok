import 'package:flutter/material.dart';
import 'package:kuebalok/models/cart_model.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/cart_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:kuebalok/widgets/checkout_card.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    int totalPrice = cartProvider.totalPrice(authProvider.user.id!);
    List<CartModel> cartUser = cartProvider.carts
        .where((element) => element.userId == authProvider.user.id)
        .toList();
    totalPrice = totalPrice + 10000;
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
                            "berikut rincinan pesanan anda",
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
                          Text(
                            "Item Ordered",
                            style: blackTextStyle,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Column(
                            children: cartUser
                                .map((cart) => CheckoutCard(cart: cart))
                                .toList(),
                          ),
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
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       "Kur Balok Roll",
                            //       style: greyTextStyle,
                            //     ),
                            //     Text(
                            //       "18.390.000",
                            //       style: blackTextStyle,
                            //     ),
                            //   ],
                            // ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ongkir",
                                  style: greyTextStyle,
                                ),
                                Text(
                                  "10000",
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
                                  totalPrice.toString(),
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
                                  authProvider.user.name.toString(),
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
                                  authProvider.user.phoneNumber.toString(),
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
                                  authProvider.user.address.toString(),
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
                              // CHECKOUT HANDLE
                              setState(() {
                                isLoading = true;
                              });

                              if (await transactionProvider.checkout(
                                  authProvider.user.token!,
                                  cartProvider.carts,
                                  totalPrice)) {
                                // hapus cart jika berhasil checkout
                                for (var item in cartUser) {
                                  cartProvider.removeAllCart(item.id!);
                                }
                                // for (var i = 0; i < cartUser.length; i++) {
                                //   cartProvider.removeAllCart();
                                // }
                                Navigator.pushNamedAndRemoveUntil(context,
                                    '/success-order-page', (route) => false);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: alertColor,
                                    content: Text(
                                      "Gagal Checkout Coba Lagi!",
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
                              "Pesan Sekarang",
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
