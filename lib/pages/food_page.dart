import 'package:flutter/material.dart';
import 'package:kuebalok/models/food_model.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/food_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:kuebalok/widgets/food_tile.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    FoodProvider foodProvider = Provider.of<FoodProvider>(context);

    List<FoodModel> makanan = foodProvider.foods
        .where((element) => element.kategori == 'Makanan')
        .toList();

    List<FoodModel> minuman = foodProvider.foods
        .where((element) => element.kategori == 'Minuman')
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
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
                        "Pesan Sekarang!",
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
                        "Makanan",
                        style: blackTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: makanan
                            .map(
                              (foods) => FoodTile(
                                food: foods,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                // Minuman
                SizedBox(
                  height: 16,
                ),
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
                        "Minuman",
                        style: blackTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: minuman
                            .map(
                              (foods) => FoodTile(
                                food: foods,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
