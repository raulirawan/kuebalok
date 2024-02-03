import 'package:flutter/material.dart';
import 'package:kuebalok/pages/empty_order.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/cart_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:kuebalok/widgets/cart_card.dart';
import 'package:kuebalok/widgets/food_tile.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return cartProvider.carts
                .where((element) => element.userId == authProvider.user.id)
                .length ==
            0
        ? EmptyOrder()
        : Scaffold(
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
                                  "Keranjang Anda",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: medium,
                                  ),
                                ),
                                Text(
                                  "Checkout Sekarang!",
                                  style: greyTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultMargin,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Container(
                              child: Column(
                                children: cartProvider.carts
                                    .where(
                                      (element) =>
                                          element.userId ==
                                          authProvider.user.id,
                                    )
                                    .map(
                                      (cart) => CartCard(
                                        cart: cart,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          //
                          SizedBox(
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                    //BOTTOM NAV

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 16,
                        ),
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        color: Colors.white,
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Harga:",
                                  style: greyTextStyle,
                                ),
                                Text(
                                  "${cartProvider.totalPrice(authProvider.user.id!)}",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 170,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/checkout-page');
                                },
                                child: Text(
                                  "Checkout",
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
                            )
                          ],
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
