import 'package:flutter/material.dart';
import 'package:kuebalok/models/cart_model.dart';
import 'package:kuebalok/pages/detail_food_page.dart';
import 'package:kuebalok/providers/cart_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 65,
            height: 65,
            margin: EdgeInsets.only(
              right: 10,
              bottom: defaultMargin,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cart.food!.photo!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.food!.name!,
                    style: blackTextStyle,
                  ),
                  Text(
                    cart.food!.price.toString(),
                    style: greyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    cartProvider.reduceQuantity(cart.id!);
                    print('button min');
                    print("id cart : " + cart.id.toString());
                    print("quantity : " + cart.quantity.toString());
                  },
                  child: Image.asset(
                    'assets/btn-min.png',
                    width: 24,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    cart.quantity.toString(),
                    style: blackTextStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartProvider.addQuantity(cart.id!);
                    print('button plus');
                    print("id cart : " + cart.id.toString());
                    print("quantity : " + cart.quantity.toString());
                  },
                  child: Image.asset(
                    'assets/btn-plus.png',
                    width: 24,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
