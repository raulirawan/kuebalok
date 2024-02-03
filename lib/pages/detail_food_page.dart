import 'package:flutter/material.dart';
import 'package:kuebalok/models/food_model.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/cart_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class DetailFoodPage extends StatefulWidget {
  final FoodModel food;

  const DetailFoodPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  _DetailFoodPageState createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        backgroundColor: bgWhite,
        body: SafeArea(
          child: Stack(
            children: [
              // Gambar Makanan
              Column(
                children: [
                  Image.network(
                    widget.food.photo.toString(),
                    width: double.infinity,
                  ),
                ],
              ),
              // Arrow Back
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    left: 16,
                  ),
                  child: Image.asset(
                    'assets/ic-arrow-back.png',
                    width: 24,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 300,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  color: bgWhite,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 26,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.food.name}",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${widget.food.price}",
                                  style: greyTextStyle,
                                ),
                              ],
                            ),
                            // Container(
                            //   child: Row(
                            //     children: [
                            //       Image.asset(
                            //         'assets/btn-min.png',
                            //         width: 26,
                            //       ),
                            //       SizedBox(
                            //         width: 10,
                            //       ),
                            //       Text(
                            //         "6",
                            //         style: blackTextStyle.copyWith(
                            //           fontSize: 16,
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: 10,
                            //       ),
                            //       Image.asset(
                            //         'assets/btn-plus.png',
                            //         width: 26,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${widget.food.description}",
                        style: greyTextStyle,
                      ),
                    ],
                  ),
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
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        cartProvider.addCart(
                          widget.food,
                          authProvider.user.id!,
                        );
                        print(authProvider.user.id);
                      },
                      child: Text(
                        "Tambah Ke Dalam Keranjang",
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
        ));
  }
}
